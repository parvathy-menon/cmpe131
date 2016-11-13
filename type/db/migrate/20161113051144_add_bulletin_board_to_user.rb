class AddBulletinBoardToUser < ActiveRecord::Migration
  def change
    add_reference :users, :bulletin_board, index: true, foreign_key: true
  end
end
