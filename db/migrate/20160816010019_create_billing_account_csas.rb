class CreateBillingAccountCsas < ActiveRecord::Migration[5.0]

  def change
    create_table :csas do |t|
      t.string :name
      t.string :state
      t.string :code

      t.timestamps
    end
  end

  def change
    create_table :billing_accounts do |t|
      t.string :name
      t.string :code

      t.timestamps
    end
  end

  def change
    create_table :billing_account_csas do |t|
      t.belongs_to :csa, index: true
      t.belongs_to :billing_accounts, index: true

      t.timestamps
    end
  end
end
