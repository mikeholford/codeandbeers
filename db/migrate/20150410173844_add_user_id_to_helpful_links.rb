class AddUserIdToHelpfulLinks < ActiveRecord::Migration
  def change
    add_column :helpful_links, :user_id, :integer
  end
end
