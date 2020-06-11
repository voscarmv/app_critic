class CreateOpinions < ActiveRecord::Migration[6.0]
  def change
    create_table :opinions do |t|
      t.text :text
      t.text :authorid

      t.timestamps
    end
    add_index :opinions, :authorid
  end
end
