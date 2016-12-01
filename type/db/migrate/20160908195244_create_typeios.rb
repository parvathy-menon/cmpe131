class CreateTypeios < ActiveRecord::Migration
  def change
    create_table :typeios do |t|
      t.string :username
      t.text :body

      t.timestamps null: false
    end
  end
end
