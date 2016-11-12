class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body
      t.int :likes
      t.string :email

      t.timestamps null: false
    end
  end
end
