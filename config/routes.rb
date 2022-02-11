Rails.application.routes.draw do

  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
  resources :feedback
  root 'feedback#index'
  end
end
