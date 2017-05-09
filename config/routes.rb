Rails.application.routes.draw do
  root to: 'time_requests#new'
  resources :time_requests, only: [:new, :create, :show]
  post 'time_requests(/:id)', to: 'time_requests#create'
end
