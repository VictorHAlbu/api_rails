Rails.application.routes.draw do
  resources :tokens
  resources :carros
  get '/carros', to: 'carros#index'
  post '/carros', to: 'carros#create'
  get '/carros/:id', to: 'carros#show'
  put '/carros/:id', to: 'carros#update'
  delete '/carros/:id', to: 'carros#destroy'

  get '/estados', to: 'estados#index'
  get '/cidades', to: 'estados#lista_cidade'
  get '/estados-proxy', to: 'estados#proxy' #fazedno reqquisição com proxy consumir API de outro dominio | controller função proxy |
  #PROXY CONSUMO DE API PARA SISTEMAS QUE NÃO ESTÃO LIBERADO O CROS
  root 'home#index'
end
