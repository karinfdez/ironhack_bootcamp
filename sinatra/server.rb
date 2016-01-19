
require 'bundler'
Bundler.setup
require 'sinatra'
require 'json'
require "coderay"


get '/home' do
  home_page = File.read( File.dirname(__FILE__) + '/views/home.erb') 
  @home=CodeRay.scan(home_page, :erb).div
  info_server = File.read(__FILE__)
  @server = CodeRay.scan(info_server, :ruby).div
 
  erb :home
end


get '/code' do

  content_type :json
  info_server = File.read(__FILE__)
  home_page = File.read( File.dirname(__FILE__) + '/views/home.erb') 
  style_css = File.read(File.dirname(__FILE__) + '/public/css/home.css')

return {"code"=> { :server_code => info_server,
	                :home_code => home_page, 
	                :css_code => style_css, }}.to_json
end
