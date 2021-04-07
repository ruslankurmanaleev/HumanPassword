Rails.application.routes.draw do
  root "passwords#index"
  post "/", to: "passwords#create"
end
