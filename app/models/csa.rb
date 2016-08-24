class Csa < ApplicationRecord

  has_many :billing_account_csas
  has_many :billing_accounts, through: :billing_account_csas


end
