require 'rubygems'
require 'sinatra'

sections = ['work', 'art', 'teaching', 'writing', 'speaking', 'contact', 'colophon']

get '/' do
	erb :index
end


get '/:page' do
  pass unless sections.include? params[:page]
	erb params[:page].to_sym
end

not_found do
	params[:page] = "404"
	erb :fourohfour
end