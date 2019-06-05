require 'sinatra'
require 'time'
require 'date'

enable :sessions
set :session_secret, "something"
get '/your-bday' do
  @name = session[:name]
  @day = session[:day]
  @month = session[:month]
  erb :index
end

get '/your-bday2' do

  erb :index
end

post '/bday' do
  session[:name] = params[:name]
  @name = params[:name]
  @day = params[:day].to_i
  @month = params[:month].to_i
  @today = Time.now
  year = 0
  start_date = Date.new(@today.year, @today.month, @today.day)
  @month <= @today.month ? year = @today.year + 1 : year = @today.year
  finish_date = Date.new(year, @month, @day)
  @calc = finish_date - start_date
  session[:day] = @day
  session[:month] = @month
  erb :second_page
end
