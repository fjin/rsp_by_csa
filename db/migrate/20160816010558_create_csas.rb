class CreateCsas < ActiveRecord::Migration[5.0]
  def change
    create_table :csas do |t|
      t.string :name
      t.string :state
      t.string :code

      t.timestamps
    end
  end
end
