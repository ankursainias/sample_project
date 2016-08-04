Rails.application.routes.draw do
   apipie
  devise_for :users
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
       resources :users, only: [:create] do
        collection do
          get  "send_otp"
          post "check_otp"
          get  "me"
          post 'sign_in'
          post 'sign_up'
          post 'update'
          post 'update_driver'
        end
      end
    end
  end
end
