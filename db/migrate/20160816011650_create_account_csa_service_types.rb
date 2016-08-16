class CreateAccountCsaServiceTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :account_csa_service_types do |t|
      t.integer :billing_account_id
      t.integer :csa_id
      t.integer :service_type_id

      t.timestamps
    end
  end
end
