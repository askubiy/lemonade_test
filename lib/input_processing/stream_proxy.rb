require "uri"

class InputProcessing::StreamProxy
  def initialize(input_string)
    @input_string = input_string
    @ios = nil
    determine_source
  end

  def get_line
    @ios.gets
  end

  private

  def determine_source
    if input_is_file_path?
      @ios = InputProcessing::FileStream.new(format_file_path).get_ios
    elsif input_is_url?
      @ios = InputProcessing::UrlStream.new(@input_string).get_ios
    else
      @ios = InputProcessing::StringStream.new(@input_string).get_ios
    end
  end

  def input_is_url?
    begin
      uri = URI.parse(@input_string)
      uri.kind_of?(URI::HTTP) or uri.kind_of?(URI::HTTPS)
    rescue URI::InvalidURIError => e
      false
    end
  end

  def input_is_file_path?
    File.exist?(format_file_path)
  end

  def format_file_path
    "#{Rails.root}/public/uploads/#{@input_string}"
  end
end
