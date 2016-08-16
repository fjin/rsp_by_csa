class CreateRspTechnologyTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :rsp_technology_types do |t|
      t.integer :technology_types_id
      t.integer :rsps_id

      t.timestamps
    end
  end
end
