class WebsiteController < ApplicationController
  layout '_base'
  
  def index
    @buckets = AwsBucketAccess.get_bucket_objects
    @title = 'Demo'
  end

end
