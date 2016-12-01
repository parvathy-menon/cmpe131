class AddTypeioToComment < ActiveRecord::Migration
  def change
    add_reference :comments, :typeio, index: true, foreign_key: true
  end
end
