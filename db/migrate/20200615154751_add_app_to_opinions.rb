class AddAppToOpinions < ActiveRecord::Migration[6.0]
  def change
    add_reference :opinions, :app, foreign_key: true
  end
end
