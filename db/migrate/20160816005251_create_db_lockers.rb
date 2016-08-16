class CreateDbLockers < ActiveRecord::Migration[5.0]
  def change
    create_table :db_lockers do |t|
      t.boolean :is_locked
      t.datetime :lock_time
      t.string :locked_by

      t.timestamps
    end
  end
end
