Rails.application.routes.draw do

  
  devise_for :users
  devise_scope :user do
  authenticated :user do
    root 'dashboard#index', as: :authenticated_root
  end


  unauthenticated do
    root 'devise/sessions#new', as: :unauthenticated_root
  end
end

get 'login/index'
get 'jobbank/joblist'
get 'form/index'
get 'managa_user/list'

end
