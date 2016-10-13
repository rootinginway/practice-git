#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
	erb :about
end

get '/contacts' do
	erb :contacts
end

get '/visit' do
	erb :visit
end

post '/visit' do
	@user = params[:username]
	@datetime = params[:dt]
	@phone = params[:phone]
	
	f = File.open "./public/users.txt", 'a'
	f.write "User - #{@user}, datetime - #{@datetime}, phone - #{@phone}"
	f.close

	@title = "Dear #{@user}! Come at #{@datetime}"

	erb :message
end

post '/contacts' do
	@emailforcontact = params[:emailforcontact]
	@message = params[:message]

	f = File.open "./public/contacts.txt", 'a'
	f.write "Message [#{@message}] from #{@emailforcontact}"
	f.close

	@title = "Thanks for feedback"
	erb :message
end