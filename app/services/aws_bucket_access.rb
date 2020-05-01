require 'aws-sdk-s3' 

class AwsBucketAccess

  class << self

    def get_bucket_objects

      dir_path = 'public/S3Images'

      #clear out local directory of S3 images
      ImageProcessor.remove_images_from_directory(dir_path)

      #retrieve image names from S3 bucket
      images = S3_BUCKET.objects

      #download each image and store in public app directory
      images.each do |item|
        image = S3_BUCKET.object(item.key)
        path = dir_path + '/' + item.key
        image.get(response_target: path)
      end

    end

    def remove_image_from_bucket(key)
      
      #remove image
      S3_BUCKET.delete_objects(
        delete: {
          objects: [
            {
              key: key
            }
          ]
        }
      )
    end

  end

end
