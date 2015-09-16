Rails.application.routes.draw do
  resources :robots, only: [:index, :new] do
    collection do
      post 'command'
    end
  end

  root 'robots#new'

end
