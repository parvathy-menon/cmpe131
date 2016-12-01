class CreateBulletinBoards < ActiveRecord::Migration
  def change
    create_table :bulletin_boards do |t|
      t.integer :num_posts

      t.timestamps null: false
    end
  end
end
