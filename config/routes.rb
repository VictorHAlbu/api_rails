Rails.application.routes.draw do
  resources :carros
  get '/estados', to: 'estados#index'
  get '/cidades', to: 'estados#lista_cidade'
  get '/estados-proxy', to: 'estados#proxy' #fazedno reqquisição com proxy consumir API de outro dominio | controller função proxy |
  #PROXY CONSUMO DE API PARA SISTEMAS QUE NÃO ESTÃO LIBERADO O CROS
  root 'home#index'
end
