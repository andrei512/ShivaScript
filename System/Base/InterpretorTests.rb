def run_interpretor_tests
	Dir.glob(File.join(".", "System", "InterpretorTests", "*.in")).each do |file|
		test_input = open(file).read

		expected_output_file = file
		expected_output_file[".in"] = ".out"

		expected_output = open(expected_output_file).read

		output = interpret(test_input).to_s

		puts "Input:"
		puts test_input
		puts "Output:"
		puts output
		puts "Expected output:"
		puts expected_output

		if output.gsub(/\s+/, "") == expected_output.gsub(/\s+/, "") 
			puts "Valid!"
		else
			puts "Invalid!"
		end


	end
end