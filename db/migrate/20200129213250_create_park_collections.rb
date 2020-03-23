class CreateParkCollections < ActiveRecord::Migration[6.0]
  def change
    create_table :park_collections do |t|
      t.string :park_id
      t.text :description
      t.string :directions_url
      t.string :url
      t.string :full_name
      t.string :user_id

      t.timestamps
    end
  end
end
