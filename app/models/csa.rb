class Csa < ApplicationRecord

  has_many :billing_account_csas, dependent: :destroy
  has_many :billing_accounts, through: :billing_account_csas
  has_many :csa_service_types, dependent: :destroy
  has_many :service_types, through: :csa_service_types


end
