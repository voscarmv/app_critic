class Opinion < ApplicationRecord
  belongs_to :author, foreign_key: 'authorid', class_name: 'User'
  belongs_to :app, optional: true
end
