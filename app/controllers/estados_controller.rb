class EstadosController < ApplicationController
   
    def index
    realeaseCrosDomain
    estados = [ #criando  api de estados
        {nome: "São Paulo", uf: "SP"},
        {nome: "Rio de Janeiro", uf: "RJ"},
        {nome: "Minas Gerais", uf: "MG"},
        {nome: "Goias", uf: "GO"},
        {nome: "Espirito Santo", uf: "ES"},
    ] 

    if params["uf"].present? # verifica se uf ta presente, se tiver ele faz um select de uf | função serve para fazer seleção de dados de API pelo "uf"
        estados = estados.select{|e| e[:uf].downcase == params["uf"].downcase}
    end
    render json: estados, status: 200 
   end

   def proxy #função para fazer requisição de API de outro dominio para seu localhost
        require 'rest-client'
        estados = RestClient.get("http://localhost:3000/estados.json") #Reqquisição foi feita da pŕopia api criada no host
        render json: estados.body, status: 200 
        #ATENÇÃO ESSE CONSUMO DE API FOI DA CRIADA NO PRÓPIO PROJETO, MAS ESSA FUNÇÃO É PARA BUSCAR POR SITE DE QUALQUER DOMINIO QUE DISPONIBILIZE API
        #para API que não estão liberado o CROS
    end

   def lista_cidade
    realeaseCrosDomain

    cidades = [
        {nome: "São Paulo", uf:"SP"},
        {nome: "São Bernado do Campo", uf:"SP"},
        {nome: "Mauá", uf:"SP"},
        {nome: "Campinas", uf:"SP"},
        {nome: "Niteroi", uf:"RJ"},
        {nome: "Cabo Frio", uf:"RJ"},
        {nome: "Copa Cabana", uf:"RJ"},
       ] 
        if params["uf"].present?
            cidades = cidades.select{|e| e[:uf].downcase == params["uf"].downcase}
        end  
        render json: cidades, status: 200
    end

    private
    
    def realeaseCrosDomain
        #PERMITINDO APLICAÇÃO PARA UALQUER HOST CONSEGUI ACESSAR API CROSS DO MAIN
        headers['Access-Control-Allow-Origin'] = '*'
        headers['Access-Control-Allow-Methods'] = 'GET'
        headers['Access-Control-Request-Method'] = '*'
        headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept'
    end
     
end
  