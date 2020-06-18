class CreateFollowings < ActiveRecord::Migration[6.0]
  def change
    create_table :followings do |t|
      t.integer :followerid, null: false
      t.integer :followedid, null: false

      t.timestamps
    end
    add_index :followings, :followerid
    add_index :followings, :followedid
  end
end
