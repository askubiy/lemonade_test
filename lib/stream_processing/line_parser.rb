module StreamProcessing
  module LineParser
    def self.parse(line)
      line.downcase.scan(/\w+/)
    end
  end
end
