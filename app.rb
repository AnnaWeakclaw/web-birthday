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
  year = 0
  start_date = Date.new(@today.year, @today.month, @today.day)
  @month <= @today.month ? year = @today.year + 1 : year = @today.year
  finish_date = Date.new(year, @month, @day)
  @calc = finish_date - start_date
  erb :second_page
end