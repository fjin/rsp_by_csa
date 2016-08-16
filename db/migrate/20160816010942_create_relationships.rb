class CreateRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :relationships do |t|
      t.string :relationship_type
      t.integer :billing_account_id
      t.integer :rsp_id

      t.timestamps
    end
  end
end
