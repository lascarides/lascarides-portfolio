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

before do
  headers "Content-Type" => "text/html; charset=utf-8"
  cache_control :public, :must_revalidate, :max_age => 600
end

