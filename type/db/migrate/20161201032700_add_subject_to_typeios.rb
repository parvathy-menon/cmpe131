class AddSubjectToTypeios < ActiveRecord::Migration
  def change
    add_column :typeios, :subject, :string
  end
end
