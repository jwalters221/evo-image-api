require 'aws-sdk-s3' 

class AwsBucketAccess

  class << self

    def get_bucket_objects

      #set public app image directory
      dir_path = 'public/S3Images'

      #remove all files from public app image directory
      Dir.foreach(dir_path) do |f|
        fn = File.join(dir_path, f)
        File.delete(fn) if f != '.' && f != '..'
      end

      #retrieve image names from S3 bucket
      images = S3_BUCKET.objects

      #download each image and store in public app directory
      images.each do |item|
        image = S3_BUCKET.object(item.key)
        path = dir_path + '/' + item.key
        image.get(response_target: path)
      end

    end
  end

end
