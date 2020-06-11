class CreateFollowings < ActiveRecord::Migration[6.0]
  def change
    create_table :followings do |t|
      t.integer :followerid
      t.integer :followedid

      t.timestamps
    end
    add_index :followings, :followerid
    add_index :followings, :followedid
  end
end
