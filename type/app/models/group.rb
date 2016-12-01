class Group < ActiveRecord::Base
    belongs_to :bulletin_board #establishing relationships with classes (bulletin_board, users)
    has_and_belongs_to_many :users
end
