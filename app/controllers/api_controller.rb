class ApiController < ActionController::API

	def image_handler

	  dir_path = 'public/APIImages/'
	  ImageProcessor.remove_images_from_directory(dir_path)
	  
	  base_64_image = params[:base64]
	  file_name = params[:filename]

	  File.open(dir_path + file_name, 'wb') do |f|
		f.write(Base64.decode64(base_64_image))
	  end

	  string = OcrServices.get_string_from_image(dir_path + file_name)

	  # Do whatever you want with foo
	  render json: {text: string, another_value: 'more'}
	end

end
