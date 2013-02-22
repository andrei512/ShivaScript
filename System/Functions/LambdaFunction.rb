class LambdaFunction < Function 
	def trigger_symbols
		[:lambda]
	end

	def run list
		if list.count == 2
			params = list[0]
			translation = list[1]

			return Lambda.lambda_with_params_and_translation params, translation
		else
			return nil
		end
	end
	
end