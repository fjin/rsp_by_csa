
class InboundService

  def self.importFromInbound
    importCsasFromInbound
    importBillingAccountsFromInbound
    importBillingAccountCSARelationshipsFromInbound
    importServiceTypesFromInbound
    importBillingAccountCSAServiceTypesFromInbound

    deleteBillingAccountsThatAreNotInbound

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
      unless Inbound.find_by(billing_account: ba.code)
        ba.csas.clear
        ba.delete
      end
    end


  end

  def self.deleteCSAsThatNotInbound

  end

  def self.deleteCsaServiceTypesThatNotInbound

  end


end