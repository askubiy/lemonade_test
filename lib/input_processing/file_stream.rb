class InputProcessing::FileStream < InputProcessing::StreamCommon
  def initialize(file_path)
    fd = IO.sysopen(file_path, "r")
    @ios = IO.new(fd)
  end
end
