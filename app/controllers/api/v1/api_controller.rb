class Api::V1::ApiController < ApplicationController

  def get_csas
    render json: Csa.all
  end

  def get_billing_accounts
    render json: BillingAccount.all
  end

  def get_inbounds
    render json: Inbound.all
  end

  def get_billing_account_csas
    render json: BillingAccountCsa.all
  end

  def get_account_csa_service_types
    render json: AccountCsaServiceType.all
  end

  def get_relationships
    render json: Relationship.all
  end

  def get_rsps
    render json: Rsp.all
  end

  def get_rsp_csa_exclusions
    render json: RspCsaExclusion.all
  end

  def get_rsp_technology_types
    render json: RspTechnologyType.all
  end

  def get_service_types
    render json: ServiceType.all
  end

  def get_csa_service_types
    render json: CsaServiceType.all
  end

  def get_technology_types
    render json: TechnologyType.all
  end

end
