class StreamProcessing::Processor
  def initialize(ios)
    @ios = ios
  end

  def process_stream
    while line = @ios.get_line do
      parsed_line = StreamProcessing::LineParser.parse(line)
      if parsed_line.length > 0
        Word.bulk_insert(parsed_line)
      end
    end
  end
end
