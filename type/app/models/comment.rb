class Comment < ActiveRecord::Base
    belongs_to :typeio #establishing relationships with classes (typeio, user)
    belongs_to :user
end
