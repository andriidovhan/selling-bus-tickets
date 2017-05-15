Rails.application.routes.draw do

  get 'tickets/:id/buy' => "tickets#edit", as: "buy_ticket"
  get 'tickets/my_tickets' => "tickets#my_tickets", as: "my_tickets"
  put 'tickets/:id' => "tickets#update"

  root to: 'timetables#index'
  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'

  resources :timetables do
    member do
      get :delete
    end
  end

  resources :users do
    member do
      get :delete
    end
  end
end
