class AddSlugIndex < ActiveRecord::Migration[7.0]
  def change
    add_index :animals, :slug
  end
end
