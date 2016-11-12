class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.int :likes
      t.string :body

      t.timestamps null: false
    end
  end
end
