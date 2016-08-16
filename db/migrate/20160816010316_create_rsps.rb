class CreateRsps < ActiveRecord::Migration[5.0]
  def change
    create_table :rsps do |t|
      t.string :home_phone
      t.string :business_phone
      t.string :home_website
      t.string :fibre_website
      t.string :satellite_website
      t.string :wireless_website
      t.string :business_website
      t.string :business_name
      t.string :name
      t.string :logo_name
      t.string :service
      t.string :rsp_type

      t.timestamps
    end
  end
end
