Rails.application.routes.draw do
  post 'webhook/:key' => 'webhook#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
