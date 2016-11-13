class Typeio < ActiveRecord::Base
  validates :body, :length => { :maximum => 150 }
  validates :body, :presence => true
  
  belongs_to :user
  has_many :comment
  belongs_to :bulletin_board
  
end
