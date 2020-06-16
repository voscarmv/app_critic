class App < ApplicationRecord

  validates_presence_of :name
  validates_presence_of :url
  validates_presence_of :description

  has_many :opinions

  def positive
    totalopinions = self.opinions.count.to_f
    if totalopinions == 0
      return 0
    end
    "%.2f" % (100 * self.opinions.where(sentiment: true).count.to_f / totalopinions)
  end
  def negative
    totalopinions = self.opinions.count.to_f
    if totalopinions == 0
      return 0
    end
    "%.2f" % (100 * self.opinions.where(sentiment: false).count.to_f / totalopinions)
  end
end
