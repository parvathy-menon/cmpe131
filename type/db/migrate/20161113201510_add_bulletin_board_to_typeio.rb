class AddBulletinBoardToTypeio < ActiveRecord::Migration
  def change
    add_reference :typeios, :bulletin_board, index: true, foreign_key: true
  end
end
