class App < ApplicationRecord
  has_many :opinions

  def positive
    "%.2f" % (100 * self.opinions.where(sentiment: true).count.to_f / self.opinions.count.to_f)
  end
  def negative
    "%.2f" % (100 * self.opinions.where(sentiment: false).count.to_f / self.opinions.count.to_f)
  end
end
