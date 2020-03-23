class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.integer :park_collection_id
      t.text :entry, default: "Add notes here by typing in the text box below"
      t.timestamps
    end
  end
end
