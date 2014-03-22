class AddThoughtToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :thought, :string
  end
end
