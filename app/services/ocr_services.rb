
class OcrServices

  class << self

    def get_string_from_image

      filepath = 'public/S3Images/text1.png'
      image = RTesseract.new(filepath, lang: 'eng')
      text = image.to_s # Getting the value

    end
  end

end
