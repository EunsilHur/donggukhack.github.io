class AddSearchInfoToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :loc, :string
    add_column :posts, :b_type, :string
  end
end
