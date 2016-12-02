class RemoveLikesFromCommentsTypeios < ActiveRecord::Migration
  def change
  	remove_column :comments, :likes
  	remove_column :typeios, :likes
  end
end
