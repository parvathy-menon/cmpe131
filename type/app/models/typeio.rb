class Typeio < ActiveRecord::Base

  validates :body, :length => { :maximum => 150 }
  validates :body, :presence => true
  validates :subject, :presence => true
  
  acts_as_votable

  belongs_to :user
  has_many :comment
  belongs_to :bulletin_board
  
end
