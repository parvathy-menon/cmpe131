class WelcomeController < ApplicationController
  def index
     if user_signed_in?
	id = current_user.bulletin_board_id
	redirect_to bulletin_board_path(id)
    end
  end
end

