class UpdateEventInfo < ActiveRecord::Migration
  def change
    remove_column :events, :description, :string
    add_column :events, :description, :text
  end
end
