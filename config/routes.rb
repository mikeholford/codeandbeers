Codeandbeers::Application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  devise_for :users, :controllers => {:registrations => "users"}

  devise_scope :user do
    get 'users/:id' => 'users#show', as: "user"
  end
  
  root 'statics#home'
  resources :statics


  #Match Routes
  match '/about' => 'statics#about', via: 'get', as: 'about'

end
