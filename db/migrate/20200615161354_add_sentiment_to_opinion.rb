class AddSentimentToOpinion < ActiveRecord::Migration[6.0]
  def change
    add_column :opinions, :sentiment, :boolean, default: true
  end
end
