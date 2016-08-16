class CreateBillingAccountCsaExclusions < ActiveRecord::Migration[5.0]
  def change
    create_table :billing_account_csa_exclusions do |t|
      t.integer :billing_account_id
      t.integer :csa_id

      t.timestamps
    end
  end
end
