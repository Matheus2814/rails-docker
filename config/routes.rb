require 'sidekiq/web'

Rails.application.routes.draw do

    get 'home', to: 'home#index'
    
    mount Sidekiq::Web => '/sidekiq'

end
