Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  post "/session/create" => "session#create"
  get "/first_sign_in" => "welcome#first_sign_in"
end
