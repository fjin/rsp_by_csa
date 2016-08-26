class BillingAccountsController < ApplicationController
  def index
    @billing_accounts = BillingAccount.all
  end

  def show
    @billing_account = BillingAccount.find(params[:id])
  end

  def new
    @billing_account = BillingAccount.new
  end

  def edit
    @billing_account = BillingAccount.find(params[:id])
  end

  def create
    @billing_account = BillingAccount.new(billing_account_params)

    if @billing_account.save
      redirect_to @billing_account
    else
      render 'new'
    end
  end

  def update
    @billing_account = BillingAccount.find(params[:id])

    if @billing_account.update(billing_account_params)
      redirect_to @billing_account
    else
      render 'edit'
    end
  end

  def destroy
    @billing_account = BillingAccount.find(params[:id])
    @billing_account.destroy

    redirect_to billing_account_params
  end

  private
  def billing_account_params
    params.require(:billing_account).permit(:code, :name)
  end


end
