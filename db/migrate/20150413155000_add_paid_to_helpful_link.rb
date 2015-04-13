class AddPaidToHelpfulLink < ActiveRecord::Migration
  def change
    add_column :helpful_links, :paid, :boolean, default: false
  end
end
