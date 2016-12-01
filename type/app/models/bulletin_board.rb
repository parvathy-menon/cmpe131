class BulletinBoard < ActiveRecord::Base
    has_one :user
    has_one :group
    has_many :typeio
    acts_as_votable

end
