class Api::V1::ApiController < ApplicationController

  def get_csas
    @csas = Csa.all
    render json: @csas
  end

  def get_billing_accounts
    @billingAccounts = BillingAccount.all
    render json: @billingAccounts
  end

  def get_inbounds
    @inbounds = Inbound.all
    render json: @inbounds
  end
end
