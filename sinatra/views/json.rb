require 'sinatra'
require 'json'
require 'coderay'

get '/code' do

 content_type :json
 # @things = Thing.all(:order => :created_at.desc)
 # { "code": "The code you wrote" }.to_json

  info_server = File.read('server.rb')
  home_page = File.read( File.dirname(__FILE__) + '/views/home.erb') 
  style_css = File.read(File.dirname(__FILE__) + '/public/home.css')
  
  {:code_wrote => { :server => info_server,
              		:home => home_page, 
              		:css => style_css, }}.to_json

end
