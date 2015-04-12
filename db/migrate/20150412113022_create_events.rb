class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|

      t.string :name
      t.string :description
      t.string :image
      t.date :date
      t.time :time_start
      t.time :time_end
      t.string :ticket_link

      t.timestamps null: false
    end
  end
end
