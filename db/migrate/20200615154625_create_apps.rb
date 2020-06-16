class CreateApps < ActiveRecord::Migration[6.0]
  def change
    create_table :apps do |t|
      t.string :name, null: false
      t.string :url, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
