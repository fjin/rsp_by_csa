class BillingAccount < ApplicationRecord

  has_many :billing_account_csas, dependent: :destroy
  has_many :csas, through: :billing_account_csas


end
