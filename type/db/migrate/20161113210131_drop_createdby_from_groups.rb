class DropCreatedbyFromGroups < ActiveRecord::Migration
  def change
		remove_column :groups, :created_by
  end
end
