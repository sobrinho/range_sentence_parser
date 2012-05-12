class RangeSentenceParser
  # Parse the sentence and return a collection of numbers and/or ranges
  #
  # Usage:
  #
  #   RangeSentenceParser.parse!('')                      # => []
  #   RangeSentenceParser.parse!('1990')                  # => [1990]
  #   RangeSentenceParser.parse!('1990; 1995')            # => [1990, 1995]
  #   RangeSentenceParser.parse!('1990-1995')             # => [1990..1995]
  #   RangeSentenceParser.parse!('1990; 1995-2000; 2005') # => [1990, 1995..2000, 2005]
  def self.parse!(sentence)
    range_sentence_parser = self.new(sentence)
    range_sentence_parser.parse!
  end

  # Validate the sentence and return true or false
  #
  # Usage:
  #
  #   RangeSentenceParser.valid?('1990; 1995-2000; 2005') # => true
  #   RangeSentenceParser.valid?('1990, 1995-2000, 2005') # => false
  def self.valid?(sentence)
    range_sentence_parser = self.new(sentence)
    range_sentence_parser.valid?
  end

  # Performs the opposite of valid?
  #
  # Usage:
  #
  #   RangeSentenceParser.invalid?('1990; 1995-2000; 2005') # => false
  #   RangeSentenceParser.invalid?('1990, 1995-2000, 2005') # => true
  def self.invalid?(sentence)
    range_sentence_parser = self.new(sentence)
    range_sentence_parser.invalid?
  end

  def initialize(sentence)
    self.sentence = sentence
  end

  def parse!
    raise InvalidSentenceError if invalid?

    sentence.split(';').map do |number|
      if number =~ /(\d+)-(\d+)/
        Range.new($1.to_i, $2.to_i)
      else
        number.to_i
      end
    end
  end

  def valid?
    sentence.empty? || sentence =~ /^\d+(-\d+)?(\s*;\s*\d+(-\d+)?)*;?$/
  end

  def invalid?
    !valid?
  end

  private

  attr_accessor :sentence
end
