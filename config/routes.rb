Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :guilds, only: :index do
        collection do
          post :modify_prefix
          get ':guild_id' => 'guilds#show'
        end
      end
    end
  end
end
