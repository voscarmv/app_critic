class CreateOpinions < ActiveRecord::Migration[6.0]
  def change
    create_table :opinions do |t|
      t.text :content
      t.references :user_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
