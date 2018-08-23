Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post :word_counter, to: 'words#word_counter'
  get :word_statistics, to: 'words#word_statistics'
end
