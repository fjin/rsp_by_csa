class CreateRspCsaExclusions < ActiveRecord::Migration[5.0]
  def change
    create_table :rsp_csa_exclusions do |t|
      t.integer :csa_id
      t.integer :rsp_id

      t.timestamps
    end
  end
end
