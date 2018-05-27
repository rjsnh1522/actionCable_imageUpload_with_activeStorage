Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'

      }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "homes#index"
 
  resource :homes,only:[:index] do
    collection do
      post :check_user_email
    end
  end

  resource :images,only:[:new,:create,:show]
  
end
