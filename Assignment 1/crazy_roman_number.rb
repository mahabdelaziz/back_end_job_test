require "test/unit"

class CrazyRomanNumber

	def minimal_roman(roman_number)
		new_arabic = roman_to_arabic roman_number
		return arabic_to_roman new_arabic
	end

	private
	def arabic_to_roman(number)
		roman_number = ""
		return "" if number.nil?
		case number
		when 4
			return "IV"
		when 9
			return "IX"
		when 49
			return "IL"
		when 99
			return "IC"
		when 499
			return "ID"
		when 999
			return "IM"	
		end

		numbers_mapping = {}
		numbers_mapping[1000] = "M"
		numbers_mapping[900]  = "CM"
		numbers_mapping[500]  = "D"
		numbers_mapping[400]  = "CD"
		numbers_mapping[100]  = "C"
		numbers_mapping[90]   = "XC"
		numbers_mapping[50]   = "L"
		numbers_mapping[40]   = "XL"
		numbers_mapping[10]   = "X"
		numbers_mapping[9]    = "IX"
		numbers_mapping[5]    = "V"
		numbers_mapping[4]    = "IV"
		numbers_mapping[1]    = "I"
		numbers_mapping.each do |a_number, roman_val|
			while number > a_number - 1
				roman_number += roman_val
				number -= a_number
			end
		end

		return roman_number
	end

	def roman_to_arabic(roman)
		return nil unless (roman =~ /[^IVXLCDM]/).nil? # return if invalid romain number
		roman_arabic_mapping = {
			"I" => 1,
			"V" => 5,
			"X" => 10,
			"L" => 50,
			"C" => 100,
			"D" => 500,
			"M" => 1000
		}

		current_number = 0
		last_number = 0
		arabic_number = 0

		roman.each_char do |c|
			current_number = roman_arabic_mapping[c]
			if last_number < current_number && last_number != 0
				current_number -= last_number
				arabic_number += current_number - last_number
				last_number = current_number
			else
				arabic_number += current_number
				last_number= current_number
			end
		end

		return arabic_number
	end
end


class TestCrazyRomanNumber < Test::Unit::TestCase
	def test_crazy_roman_number
		c = CrazyRomanNumber.new
		assert_equal(c.minimal_roman("XCIX"), "IC")		
		assert_equal(c.minimal_roman("MMMMDLXXXXVIII"), "MMMMDXCVIII")		
		assert_equal(c.minimal_roman("ABC"), "")		
		assert_equal(c.minimal_roman("VIIII"), "IX")		
		assert_equal(c.minimal_roman("DLXXXX"), "DXC")		
	end
end

 