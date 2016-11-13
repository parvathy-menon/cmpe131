class RegistrationsController < Devise::RegistrationsController
    def create
        super
				b = BulletinBoard.create
				resource.update bulletin_board: b
    end

<<<<<<< HEAD
		
  private
  
=======
>>>>>>> 3be4c28cb532e56933c6fa5acec63b7692a277a7
  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def account_update_params 
params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)

  end
end
