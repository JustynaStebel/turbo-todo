Rails.application.routes.draw do
  resources :todo_items, except: [:show] do
    member do
      patch :complete
    end
  end
end
