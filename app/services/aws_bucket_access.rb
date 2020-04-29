require 'aws-sdk-s3' 

class AwsBucketAccess

  class << self

    def get_bucket_objects

      #text = ENV['S3_BUCKET']

      images = S3_BUCKET.objects


    end
  end

end
