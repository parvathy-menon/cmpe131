class Typeio < ActiveRecord::Base
  validates :username, :presence => true
  validates :body, :length => { :maximum => 150 }
  validates :body, :presence => true
end
