
class OcrServices

  class << self

    def get_string_from_image(image_path)

      image = RTesseract.new(image_path, lang: 'eng')
      text = image.to_s # Getting the value

    end
  end

end
