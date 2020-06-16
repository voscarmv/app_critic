class App < ApplicationRecord
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
