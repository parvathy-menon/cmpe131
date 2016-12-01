class ChangeDefaultValueForLikes < ActiveRecord::Migration
  def change
  	change_column_default :typeios, :likes, 0
  end
end
