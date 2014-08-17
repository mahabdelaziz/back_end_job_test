Dir["app/models/*.rb"].each {|file| load file }

RSpec.describe "Base converter" do
	it "should accept a block in initializer" do
		c = ConverterBase.new do |from|
			from - 1
		end
		c.convert(100).should == 99
		c.convert(2).should == 1
	end

	it "should accept a block in the convert method" do
		c = ConverterBase.new
		x = c.convert(100) do |from|
			from - 1
		end
		x.should == 99
		x = c.convert(2) do |from|
			from - 1
		end
		x.should == 1
	end

end

RSpec.describe "Celsius To Fahrenheit converter" do

	it "should converter to fahrenheit" do
		c = CelsiusToFahrenheit.new
		c.convert(30).should == 86
	end
end