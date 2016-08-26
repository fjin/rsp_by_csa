class CreateCsaServiceTypes < ActiveRecord::Migration[5.0]

  def change
    create_table :csas do |t|
      t.string :name
      t.string :state
      t.string :code

      t.timestamps
    end
  end

  def change
    create_table :service_types do |t|
      t.string :code
      t.integer :is_deleted
      t.string :description
      t.integer :technology_type_id

      t.timestamps
    end
  end

  def change
    create_table :csa_service_types do |t|
      t.belongs_to :csa, index: true
      t.belongs_to :service_type, index: true

      t.timestamps
    end
  end
end
