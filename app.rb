require 'sinatra'
require 'time'

get '/your-bday' do
  erb :index
end

post '/bday' do
  @name = params[:name]
  @day = params[:day]
  @month = params[:month]
  @today = Time.now
  erb :second_page
end