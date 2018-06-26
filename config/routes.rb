Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'parkings#welcome'
  get '/parking' => 'parkings#index'
  get '/parking/:address' =>'parkings#show',as: :address
  get '/parking/:address/checkout'=>'parkings#checkout',as: :checkout
  post '/parking/users/booking' =>'parkings#create'
  get '/parking/users/booking' =>'parkings#booking', as: :booking_list
end
