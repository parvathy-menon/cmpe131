class BulletinBoard < ActiveRecord::Base
    has_one :user #establishing relationships with classes (user, group, typeio)
    has_one :group
    has_many :typeio
    acts_as_votable #uses votable gem

end
