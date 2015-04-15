class CreateFavourites < ActiveRecord::Migration
  def change
    create_table :favourites do |t|

      t.integer :user_id
      t.integer :helpful_link_id

      t.timestamps null: false
    end
  end
end
