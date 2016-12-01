class Comment < ActiveRecord::Base
    belongs_to :typeio
    belongs_to :user
end
