class ConverterBase
	attr_accessor :from_val, :converter_logic

	def initialize(&convert_block)
		@converter_logic = convert_block  
	end

	def convert(from_val=nil)
		from_val
		if block_given?
			return yield(from_val)
		elsif @converter_logic
			return @converter_logic.call(from_val)
		else
			return from_val
		end
	end

	def self.converter_name
		self.to_s.underscore
	end
end
