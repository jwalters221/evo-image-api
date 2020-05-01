class ApiController < ActionController::API

	def image_handler

	  #remove any existing images from API directory
	  dir_path = 'public/APIImages/'
	  ImageProcessor.remove_images_from_directory(dir_path)
	  
	  #retrieve parameters from API request
	  base_64_image = params[:base64]
	  file_name = params[:filename]

	  #build filepath
	  file_path = dir_path + file_name

	  #decode and store base64 image to API directory
	  File.open(dir_path + file_name, 'wb') do |f|
		f.write(Base64.decode64(base_64_image))
	  end

	  #run OCR on image
	  string = OcrServices.get_string_from_image(file_path)

	  #check to see if image contains text for S3 logic
	  msg = ImageProcessor.text_check(file_name, string)

	  #return response
	  render json: {textCheck: msg, text: string}
	end

end
