class Typeio < ActiveRecord::Base
  validates :body, :length => { :maximum => 150 }
  validates :body, :presence => true
  
  belongs_to :user
end
