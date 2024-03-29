require 'sidekiq/web'
Rails.application.routes.draw do
  # This line mounts Solidus's routes at the root of your application.
  # This means, any requests to URLs such as /products, will go to Spree::ProductsController.
  # If you would like to change where this engine is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Solidus relies on it being the default of "spree"
  mount Spree::Core::Engine, at: '/'
  mount Sidekiq::Web => '/sidekiq'

  Spree::Core::Engine.routes.draw do
    namespace :admin do
      resources :orders, only: [] do
        member do
          put :remove_from_rejected
        end
      end
    end
    namespace :api, defaults: { format: 'json' } do
      resources :products do
        resource :product_like, only: :create
      end
    end
  end

mount SolidusPaypalCommercePlatform::Engine, at: '/solidus_paypal_commerce_platform'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
