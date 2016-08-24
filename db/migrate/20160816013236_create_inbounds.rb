class CreateInbounds < ActiveRecord::Migration[5.0]
  def change
    create_table :inbounds do |t|
      t.string :billing_account
      t.string :billing_account_name
      t.string :csa_id
      t.string :csa_name
      t.string :state_territory_code
      t.string :service_type_id
      t.string :service_type_name
      t.datetime :inserted_ts
      t.datetime :source_effective_from_ts

      t.timestamps
    end
  end
end
