class AddLikesToTypeios < ActiveRecord::Migration
  def change
    add_column :typeios, :likes, :integer
  end
end
