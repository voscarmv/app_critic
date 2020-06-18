class App < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :url
  validates_presence_of :description

  has_many :opinions

  def positive
    totalopinions = opinions.count.to_f
    return 0 if totalopinions.zero?

    # rubocop:disable Style/FormatStringToken
    format('%.2f', (100 * opinions.where(sentiment: true).count.to_f / totalopinions))
    # rubocop:enable Style/FormatStringToken
  end

  def negative
    totalopinions = opinions.count.to_f
    return 0 if totalopinions.zero?

    # rubocop:disable Style/FormatStringToken
    format('%.2f', (100 * opinions.where(sentiment: false).count.to_f / totalopinions))
    # rubocop:enable Style/FormatStringToken
  end
end
