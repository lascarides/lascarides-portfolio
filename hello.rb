require 'rubygems'
require 'sinatra'
require 'haml'

set :static, true

sections = ['work', 'art', 'teaching', 'writing', 'speaking', 'contact', 'colophon']
projects = ['ssp']

get '/' do
	haml :index
end

get '/blog' do
	send_file File.join(settings.public_folder, 'blog/index.html')
end

get '/blog/*' do
	send_file File.join(settings.public_folder, "blog/#{params[:splat].first}/index.html")
end

get '/projects' do
	params[:page] = 'projects'
	haml :'projects/index'
end

get '/projects/:page' do
  pass unless projects.include? params[:page]
	haml :"projects/#{params[:page]}", {:layout => :"projects/layout"}
end

get '/:page' do
  pass unless sections.include? params[:page]
	haml params[:page].to_sym
end

not_found do
	params[:page] = "404"
	haml :fourohfour
end

before do
  headers "Content-Type" => "text/html; charset=utf-8"
  cache_control :public, :must_revalidate, :max_age => 600
end

