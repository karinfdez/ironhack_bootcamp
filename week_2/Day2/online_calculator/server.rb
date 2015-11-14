#Iteration 2
require 'sinatra'
require './lib/Calculator.rb'   #Calls the ruby file
require "sinatra/reloader" if development?

#The same as
# if development?
#require "sinatra/reloader"
#end

get "/"  do    #Main page for the 4 operations

	erb(:operations)
end


# post "/calculate_add" do
#   "Params data: " + params.inspect  #Let me inspect what is inside the hash when I press the "calculate" button
# end


# post "/add" do
#   first= params[:first_number].to_f     #Contains the name if first textbox
#   second = params[:second_number].to_f   #When do I declare that the name of this hash is "param?"
#   result=Calculator.add(first,second)
#   " The result #{first} + #{second}=#{result}"
 
# end
# post "/substract" do
#   first= params[:first_number2].to_f     #Contains the name if first textbox
#   second = params[:second_number2].to_f   #When do I declare that the name of this hash is "param?"
#   result=Calculator.substract(first,second)
#   " The result #{first} -#{second}=#{result}"
# end

# post "/divide" do
#   first= params[:first_number4].to_f     #Contains the name if first textbox
#   second = params[:second_number4].to_f   #When do I declare that the name of this hash is "param?"
#   result=Calculator.divide(first,second)
#   " The result #{first} /#{second}=#{result}"
# end
# post "/multiply" do
#   first= params[:first_number3].to_f     #Contains the name if first textbox
#   second = params[:second_number3].to_f   #When do I declare that the name of this hash is "param?"
#   result=Calculator.multiply(first,second)
#   " The result #{first} *#{second}=#{result}"
# end
#iteration3
post "/operations" do
	first= params[:first_number].to_f     #Contains the name if first textbox
	second = params[:second_number].to_f 
	operation = params["operation"]
	@result = Calculator.operation(first,second,operation)
	params["button"]
    erb (:save_button)
    
end

post "/save_result" do  #Calling the save button with the form name
	value=params[:button]      #Takes the key name of the save button
	somefile = File.open("result.txt", "a")
	somefile.puts "the result is #{value}"
	somefile.close   
         
end
