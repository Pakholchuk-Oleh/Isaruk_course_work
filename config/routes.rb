Rails.application.routes.draw do
  root to: redirect('/distributions')

  resources :distributions do
    resources :codes, except: [:index, :show]
    resources :categories, except: [:index, :show]
  end
end
