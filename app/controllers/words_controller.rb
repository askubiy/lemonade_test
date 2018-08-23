class WordsController < ApplicationController
  def word_counter
    if request.raw_post.length > 0
      Thread.new do
        Rails.application.executor.wrap do
          ios = InputProcessing::StreamProxy.new(request.raw_post)
          StreamProcessing::Processor.new(ios).process_stream
        end
      end
      render nothing: true, status: :ok
    else
      render nothing: true, status: :not_acceptable
    end
  end

  def word_statistics
    if params['input'].present?
      word = Word.find_by(word: params['input'].downcase)
      if word
        render plain: word.occurrence.to_s
      else
        render plain: '0'
      end
    else
      render nothing: true, status: :ok
    end
  end
end

