class AddUserToTypeio < ActiveRecord::Migration
  def change
    add_reference :typeios, :user, index: true, foreign_key: true
  end
end
