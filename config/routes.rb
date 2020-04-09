Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :guilds, only: :index do
        collection do
          post :modify_prefix
          get 'show' => 'guilds#show'
        end
      end

      resources :gachas, only: [:index, :create] do
        collection do
          get 'show' => 'gachas#show'
          delete :destroy
          post 'upload' => 'gachas#upload'
        end
      end

      resources :items, only: :create do
        collection do
          delete '' => 'items#destroy'
        end
      end

      resources :permissions, only: :create do
        collection do
          get 'show' => 'permissions#show'
        end
      end

      resources :details, only: [] do
        get :show, on: :collection
      end
    end
  end
end
