class CreateHelpfulLinks < ActiveRecord::Migration
  def change
    create_table :helpful_links do |t|

      t.string :name
      t.string :description
      t.string :link

      t.timestamps null: false
    end
  end
end
