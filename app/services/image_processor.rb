
class ImageProcessor

  class << self

    def remove_images_from_directory(dir_path)

      #remove all files from specified directory
      Dir.foreach(dir_path) do |f|
        fn = File.join(dir_path, f)
        File.delete(fn) if f != '.' && f != '..'
      end

    end
  end

end
