ActiveAdmin.register Event do

  permit_params :name, :description, :image, :date, :time_start, :time_end, :ticket_link
  
  index do
    selectable_column
    id_column
    column :name
    column :description
    column :date
    column :time_start
    column :time_end
    column :ticket_link 
    actions
  end

  filter :name
  filter :date
  filter :ticket_link

  form do |f|
    f.inputs "Event Details" do
      f.input :name
      f.input :description, as: :html_editor
      f.input :image
      f.input :date
      f.input :time_start
      f.input :time_end
      f.input :ticket_link
    end
    f.actions
  end

end
