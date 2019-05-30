require 'sinatra'
require 'time'
require 'date'

get '/your-bday' do
  erb :index
end

post '/bday' do
  @name = params[:name]
  @day = params[:day].to_i
  @month = params[:month].to_i
  @today = Time.now
  start_date = Date.new(@today.year, @today.month, @today.day)
  finish_date = Date.new(@today.year, @month, @day)
  @calc = finish_date - start_date
  erb :second_page
end