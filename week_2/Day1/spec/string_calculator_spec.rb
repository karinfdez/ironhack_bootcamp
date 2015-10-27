require ("./calculator.rb")
require("RSpec")

RSpec.describe "String Calculator" do 
	it "returns 0 for the empty string" do
		calc=StringCalculator.new

		expect(calc.add("")).to eq (0)
		# expect(calc.add("6\n3")).to eq (9)
	end

end

RSpec.describe "String Calculator" do 
	it "returns 14 for the strings" do
		calc=StringCalculator.new

		expect(calc.add("6\n8")).to eq (14)
		# expect(calc.add("6\n3")).to eq (9)
	end

end