class DropUsernameFromTypeios < ActiveRecord::Migration
  def change
		remove_column :typeios, :username
  end
end
