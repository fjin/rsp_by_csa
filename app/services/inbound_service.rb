
class InboundService

  def self.importFromInbound
    @inbounds = Inbound.all

    unless @inbounds.size == 0
      importServiceTypesFromInbound
      importCsasFromInbound
      importServiceTypeCsaRelationsFromInbound
      importBillingAccountsFromInbound
      importBillingAccountCSARelationshipsFromInbound
      deleteBillingAccountsThatAreNotInbound
      deleteCSAsThatNotInbound
      deleteCsaServiceTypesThatNotInbound
      importBillingAccountCSAServiceTypesFromInbound
      clearInboundTable
    end

  end


  def self.importCsasFromInbound
    @inbounds = Inbound.all
    @inbounds.each do |inbound|
      unless Csa.exists?(code: inbound.csa_id, state: inbound.state_territory_code)
        csa = Csa.new
        csa.name = inbound.csa_name
        csa.code = inbound.csa_id
        csa.state = inbound.state_territory_code
        csa.save
      else
        csa = Csa.find_by(code: inbound.csa_id, state: inbound.state_territory_code)
        csa.name = inbound.csa_name
        csa.save
      end
    end
  end


  def self.importServiceTypeCsaRelationsFromInbound
    @inbounds = Inbound.all
    @inbounds.each do |inbound|
      csa = Csa.find_by(code: inbound.csa_id, state: inbound.state_territory_code)
      serviceType = ServiceType.find_by(code: inbound.service_type_id)
      csa.service_types.push serviceType unless csa.service_types.include?(serviceType)
      csa.save
    end

  end

  def self.importBillingAccountsFromInbound
    @inbounds = Inbound.all
    @inbounds.each do |inbound|
      unless BillingAccount.exists?(code: inbound.billing_account)
        billingAccount = BillingAccount.new
        billingAccount.name = inbound.billing_account_name
        billingAccount.code = inbound.billing_account
        billingAccount.save
      else
        billingAccount = BillingAccount.find_by(code: inbound.billing_account)
        billingAccount.name = inbound.billing_account_name
        billingAccount.save
      end
    end
  end


  def self.importBillingAccountCSARelationshipsFromInbound
    @inbounds = Inbound.all
    @inbounds.each do |inbound|
      billingAccount = BillingAccount.find_by(code: inbound.billing_account)
      csa = Csa.find_by(code: inbound.csa_id, state: inbound.state_territory_code)

      billingAccount.csas.push csa unless billingAccount.csas.include?(csa)
      billingAccount.save
    end

  end

  def self.importServiceTypesFromInbound
    @inbounds = Inbound.all
    @inbounds.each do |inbound|
      unless ServiceType.exists?(code: inbound.service_type_id)
        serviceType = ServiceType.new
        serviceType.code = inbound.service_type_id
        serviceType.description = inbound.service_type_name
        serviceType.save
      end

    end

  end

  def self.importBillingAccountCSAServiceTypesFromInbound
    AccountCsaServiceType.delete_all
    @inbounds = Inbound.all
    @inbounds.each do |inbound|
      csa = Csa.find_by(code: inbound.csa_id, state: inbound.state_territory_code)
      billingAccount = BillingAccount.find_by(code: inbound.billing_account)
      serviceType = ServiceType.find_by(code: inbound.service_type_id)
      accountCsaServiceType = AccountCsaServiceType.new
      accountCsaServiceType.billing_account_id = billingAccount.id
      accountCsaServiceType.csa_id = csa.id
      accountCsaServiceType.service_type_id = serviceType.id
      accountCsaServiceType.save
    end

  end

  def self.deleteBillingAccountsThatAreNotInbound
    billingAccounts = BillingAccount.all
    billingAccounts.each do |ba|
      unless Inbound.find_by(billing_accounts: ba.code)
        billingAccountCsas = BillingAccountCsa.where(billing_account_id: ba.id)
        billingAccountCsas.map(&:delete)
        relationships = Relationship.where(billing_account_id: ba.id)
        relationships.map(&:delete)
        ba.delete
      end
    end
  end


  def self.deleteCSAsThatNotInbound
    csas = Csa.all
    csas.each do |csa|
      unless Inbound.find_by(csa_id: csa.code, state_territory_code: csa.state)
        billingAccountCsas = BillingAccountCsa.where(csa_id: csa.id)
        billingAccountCsas.map(&:delete)
        rspCsaExclusion = RspCsaExclusion.where(csa_id: csa.id)
        rspCsaExclusion.map(&:delete)
        csaServiceTypes = CsaServiceType.where(csa_id: csa.id)
        csaServiceTypes.map(&:delete)
        csa.delete
      end
    end

  end

  def self.deleteCsaServiceTypesThatNotInbound
    csaServiceTypes = CsaServiceType.all
    csaServiceTypes.each do |csaServiceType|
      serviceTypeCode = ServiceType.find(csaServiceType.service_type_id).code
      unless Inbound.find_by(service_type_id: serviceTypeCode)

        csaServiceType.delete
      end
    end
  end


  def self.clearInboundTable
    Inbound.delete_all

  end


end