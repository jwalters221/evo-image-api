class Api::ImageProcessor < ActionController::API
  def index
    
    render json: { results: "made it!" }.to_json, status: :ok
    
  end
end