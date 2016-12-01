class AddBulletinBoardToGroup < ActiveRecord::Migration
  def change
    add_reference :groups, :bulletin_board, index: true, foreign_key: true
  end
end
