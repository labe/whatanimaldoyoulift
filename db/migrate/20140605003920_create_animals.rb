class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string  :name
      t.integer :min_weight_in_lbs
      t.integer :max_weight_in_lbs
      t.string  :slug
    end

    add_index :animals, :min_weight_in_lbs
    add_index :animals, :max_weight_in_lbs
  end
end
