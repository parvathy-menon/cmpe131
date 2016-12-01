
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable #implementing devise gem

belongs_to :bulletin_board #establishing relationships with classes (bulletin_board, typeio, comment, groups)
         has_many :typeio
         has_many :comment
         has_and_belongs_to_many :groups
end
