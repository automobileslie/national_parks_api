class CreateParkCollections < ActiveRecord::Migration[6.0]
  def change
    create_table :park_collections do |t|
      t.string :park_id
      t.string :user_id

      t.timestamps
    end
  end
end
