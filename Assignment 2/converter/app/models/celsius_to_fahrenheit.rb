class CelsiusToFahrenheit < ConverterBase

	def convert(celsius=nil)
		return ((celsius * 9)/5) + 32
	end

	def self.converter_name
		"celsius_to_fahrenheit"
	end
end