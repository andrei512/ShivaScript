SHIVA_ROOT = File.dirname(__FILE__)

require SHIVA_ROOT + '\System\system.rb'

class Array
	def head
		self.first
	end

	def tail
		self[1..-1]
	end
end

def tokenize input
	tokens = []
	input.scan(/(\-?\d+(\.\d+)?|\w+|\(|\)|\+|\-|\*|\\|\&|\^|\$)/).each do |token|
		tokens << token.first
	end
	tokens
end

def detokenize token
	number_match_results = token.match(/\-?\d+(\.\d+)?/)

	if number_match_results 
		number_match = number_match_results[0]

		if number_match == token
			number = Float(token)
			if number.to_i == number
				return number.to_i
			else
				return number
			end
		end
	end

	string_match_results = token.match(/\".*\"/)

	if string_match_results
		string_match = string_match_results[0]

		if string_match == token
			return token[1..-2]
		end
	end

	return token.to_sym
end

def translate tokens
	if tokens.first == "("
		translation = []

		if tokens.last == ")"
			middle = tokens[1..-2]
			index = 0
			while index < middle.count
				token = middle[index]

				if token == "("
					end_of_list = index 
					stack = 0
					while end_of_list < middle.count 
						stack = stack + 1 if middle[end_of_list] == "("
						stack = stack - 1 if middle[end_of_list] == ")"
						if stack == 0
							break
						else
							end_of_list = end_of_list + 1
						end
					end

					other_list = middle[index..end_of_list]

					index = end_of_list

					translated_sublist = translate other_list

					translation << translated_sublist
					index = index + 1
				else 
					translation << detokenize(token)
					index = index + 1
				end
			end

			return translation
		else
			return nil
		end
	else
		return nil
	end
end

DEBUG = false

def wizz list
	puts "processing list |#{list}|" if DEBUG

	if list.count > 0 and list.head.is_a?(Symbol) == false
		wizzed_list = []

		list.each do |item|
			puts "processing atom |#{item}|" if DEBUG
			if item.is_a? Array
				puts "wizzing sublist |#{item}|" if DEBUG
				wizzed_list << wizz(item)
			else
				wizzed_list << item
			end
		end

		puts "wizzed_list = #{wizzed_list}" if DEBUG

		list = wizzed_list
	end

	if list.count >= 1 and list.head.is_a? Symbol
		trigger = list.head
		trigger_hash = Function.trigger_hash
		function = trigger_hash[trigger]
		if function
			return function.run(list.tail)
		end
	end

	if list.count == 2 and list.head.is_a? Lambda
		lambda = list.head
		params = list.tail.head

		list = lambda.wizz params

		return wizz list
	end

	return list
end

def interpret string 
	tokens = tokenize string

	# puts "tokens = #{tokens}"

	translation = translate tokens

	wizz translation
end

if ARGV.count == 0
	input = gets

	puts "#{interpret(input)}"
elsif ARGV.count == 1
	if ARGV[0] == "test"
		run_interpretor_tests
	end
end
