class App < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :url
  validates_presence_of :description

  has_many :opinions

  def positive
    totalopinions = opinions.count.to_f
    return 0 if totalopinions.zero?

    format('%<percentage>.2f', (100 * opinions.where(sentiment: true).count.to_f / totalopinions))
  end

  def negative
    totalopinions = opinions.count.to_f
    return 0 if totalopinions.zero?

    format('%<percentage>.2f', (100 * opinions.where(sentiment: false).count.to_f / totalopinions))
  end
end
