Rails.application.routes.draw do

	#root route
	root to: 'website#index'

	#api endpoint
	post '/api/process_images' => 'api#image_handler'

end
