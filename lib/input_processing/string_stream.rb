class InputProcessing::StringStream < InputProcessing::StreamCommon
  def initialize(input_string)
    @ios = StringIO.new(input_string)
  end
end
