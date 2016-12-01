class Typeio < ActiveRecord::Base

  validates :body, :length => { :maximum => 150 } #checks that there is an entry in body (less than 150) and subject 
  validates :body, :presence => true
  validates :subject, :presence => true
  
  acts_as_votable #uses votable gem

  belongs_to :user #establishing relationships with classes (user, comment, and bulletin_board)
  has_many :comment
  belongs_to :bulletin_board
  
end
