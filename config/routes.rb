Rails.application.routes.draw do
  get 'codes/new'
  get 'codes/edit'
  root to: redirect('/distributions')

  resources :distributions do
    resources :codes, except: [:index, :show]
    resources :categories, except: [:index, :show]
  end
end
