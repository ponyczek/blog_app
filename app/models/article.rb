class Article < ApplicationRecord
  validates :title, presence: true, length: { in: 5..100} 
  validates :body, presence: true, length: { minimum: 5 } 
end
