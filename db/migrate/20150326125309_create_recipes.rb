class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :ingredients
      t.text :preparations
      t.text :image

      t.timestamps
    end
  end
end
