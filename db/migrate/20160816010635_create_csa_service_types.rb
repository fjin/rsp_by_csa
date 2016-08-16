class CreateCsaServiceTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :csa_service_types do |t|
      t.integer :service_types_id
      t.integer :csas_id

      t.timestamps
    end
  end
end
