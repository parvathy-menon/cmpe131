class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.date :create_date
      t.string :created_by

      t.timestamps null: false
    end
  end
end
