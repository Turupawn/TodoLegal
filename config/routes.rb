Rails.application.routes.draw do
  resources :law_accesses
  resources :user_permissions
  resources :permissions
  resources :law_modifications
  resources :subsections
  resources :sections
  resources :books
  devise_for :users, controllers: { confirmations: 'users/confirmations', registrations: "users/registrations", sessions: "users/sessions" }
  resources :law_tags
  resources :tags
  resources :tag_types
  resources :laws
  resources :titles
  resources :chapters
  resources :articles

  root :to => "home#index"
  get '/search_law', to: 'home#search_law', as: "search_law"
  get '/terms', to: 'home#terms_and_conditions', as: "terms_and_conditions"
  get '/privacy', to: 'home#privacy_policy', as: "privacy_policy"
  get '/pricing', to: 'home#pricing', as: "pricing"
  get '/drive_search', to: 'home#drive_search', as: "drive_search"
  get '/refer', to: 'home#refer', as: "refer"

  post "subscribe" => "subscriptions#subscribe", as: "subscribe"
  get "unsubscribe" => "subscriptions#unsubscribe", as: "unsubscribe"
  get "confirm_subscription" => "subscriptions#confirm_subscription", as: "confirm_subscription"
  get "admin/users" => "admin#users", as: "admin_users"
  post "admin/grant_permission" => "admin#grant_permission", as: "admin_grant_permission"
  post "admin/revoke_permission" => "admin#revoke_permission", as: "admin_revoke_permission"
  post "admin/set_law_access" => "admin#set_law_access", as: "admin_set_law_access"
  get "admin/subscriptions" => "admin#subscriptions", as: "admin_subscriptions"
  get "signed_in" => "home#index", as: "signed_in"
  get "signed_up" => "home#index", as: "signed_up"
  get "signed_out" => "home#index", as: "signed_out"
  get "download_contributor_users" => "admin#download_contributor_users", as: "download_contributor_users"
  get "download_recieve_information_users" => "admin#download_recieve_information_users", as: "download_recieve_information_users"
  get "download_confirmed_subscriptions" => "admin#download_confirmed_subscriptions", as: "download_confirmed_subscriptions"
  get "download_pending_subscriptions" => "admin#download_pending_subscriptions", as: "download_pending_subscriptions"
  get '/covid19', to: redirect('https://drive.google.com/drive/folders/15WjHMcU2_QOukmbOyRJAFmOPxZpa0O9k')
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
