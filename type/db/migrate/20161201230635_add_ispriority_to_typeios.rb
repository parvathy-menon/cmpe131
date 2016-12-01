class AddIspriorityToTypeios < ActiveRecord::Migration
  def change
    add_column :typeios, :ispriority, :boolean, :default => false
  end
end
