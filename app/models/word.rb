class Word < ApplicationRecord
  def self.bulk_insert(words_array)
    words_hash = Hash.new(0)

    words_array.each do |word|
      words_hash[word] += 1
    end

    words = []
    words_hash.each do |key, value|
      words << Word.new(word: key, occurrence: value)
    end

    Word.import words, on_duplicate_key_update: {
      conflict_target: [:word], columns: "occurrence = excluded.occurrence + words.occurrence"
    }
  end
end
