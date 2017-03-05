Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  post "/session/create" => "session#create"
  get "/first_sign_in" => "welcome#first_sign_in"
  post "/save_password" => "session#save_password"
  get "/mail_box" => "mailbox#index"
end
