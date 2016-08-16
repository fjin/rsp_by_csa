class CreateBillingAccountCsas < ActiveRecord::Migration[5.0]
  def change
    create_table :billing_account_csas do |t|
      t.integer :csa_id
      t.integer :billing_account_id

      t.timestamps
    end
  end
end
