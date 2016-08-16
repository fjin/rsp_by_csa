class CreateServiceTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :service_types do |t|
      t.string :code
      t.integer :is_deleted
      t.string :description
      t.integer :technology_type_id

      t.timestamps
    end
  end
end
