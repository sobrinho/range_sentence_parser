require 'range_sentence_parser'
require 'range_sentence_parser/invalid_sentence_error'

RSpec::Matchers.define :be_parsed_to do |expected|
  match do |actual|
    RangeSentenceParser.parse!(actual) == expected
  end
end

RSpec::Matchers.define :be_a_valid_sentence do |expected|
  match do |actual|
    RangeSentenceParser.new(actual).valid?
  end
end

RSpec::Matchers.define :be_an_invalid_sentence do |expected|
  match do |actual|
    RangeSentenceParser.new(actual).invalid?
  end
end
