class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
<<<<<<< HEAD
         
         belongs_to :bulletin_board
=======
         has_one :bulletin_board, :dependent => :destroy
>>>>>>> 3be4c28cb532e56933c6fa5acec63b7692a277a7
end
