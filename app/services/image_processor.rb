
class ImageProcessor

  class << self

    def remove_images_from_directory(dir_path)

      #remove all files from specified directory
      Dir.foreach(dir_path) do |f|
        fn = File.join(dir_path, f)
        File.delete(fn) if f != '.' && f != '..'
      end

    end

    def text_check(filename, image_text)

      if image_text == " \n\f"
        
        #remove from S3 bucket
        AwsBucketAccess.remove_image_from_bucket(filename)

        #set message for API response
        msg = "image does not contain text, removed from S3 bucket"

      else
        msg = "image contains text, kept in S3 bucket"
      end

    end

  end

end
