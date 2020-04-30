class ApiController < ActionController::API

	def process_images
	  foo = params[:test]

	  string = OcrServices.get_string_from_image

	  # Do whatever you want with foo
	  render json: {text: string, another_value: 'more'}
	end

end
