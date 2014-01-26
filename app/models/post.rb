class Post < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true, length: { minimum: 5 , message: 'Too short'}, uniqueness: true
  validates :content, presence: true
 
end
