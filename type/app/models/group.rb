class Group < ActiveRecord::Base
    belongs_to :bulletin_board
    has_and_belongs_to_many :users
end
