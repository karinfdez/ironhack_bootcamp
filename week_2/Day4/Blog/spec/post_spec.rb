require_relative("../lib/postClass.rb")
require("RSpec")
require 'date'

RSpec.describe "Post" do 
	
	
	let (:post) {Post.new("Hello World!","blablablah...","sponsored")}

    it "should return the post title" do
		expect(post.title).to eq ("Hello World!")
	end

    it "should return the date of the post" do
		expect(post.date.hour).to eq (Time.now.hour)
	end

	it "should return the text of post" do
		expect(post.text).to eq ("blablablah...")
	end

end

