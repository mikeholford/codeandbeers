class CreateCollectionLinks < ActiveRecord::Migration
  def change
    create_table :collection_links do |t|

      t.integer :collection_id
      t.integer :helpful_link_id

      t.timestamps null: false
    end
  end
end
