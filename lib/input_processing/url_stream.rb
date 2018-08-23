require "piperator"
require "typhoeus"

class InputProcessing::UrlStream < InputProcessing::StreamCommon
  def initialize(uri)
    http_fetch = Enumerator.new do |yielder|
      request = Typhoeus::Request.new(uri.to_s)
      request.on_body do |chunk|
        yielder << chunk
      end
      request.run
    end
    @ios = Piperator::IO.new(http_fetch)
  end
end
