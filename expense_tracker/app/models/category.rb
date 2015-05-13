class Category < ActiveRecord::Base
  validates :category_title, presence: true, length: { minimum: 3 }, uniqueness: true
 
  has_many :transactions
end
