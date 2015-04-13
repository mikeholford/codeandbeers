ActiveAdmin.register HelpfulLink do

  permit_params :name, :description, :link, :user_id, :paid
  
  index do
    selectable_column
    id_column
    column :user_id
    column :name
    column :description
    column :link
    column :paid
    actions
  end

  filter :name
  filter :link
  filter :paid
  filter :user_id

  form do |f|
    f.inputs "Link Details" do
      f.input :user_id
      f.input :name
      f.input :description
      f.input :link
      f.input :paid
    end
    f.actions
  end

end
