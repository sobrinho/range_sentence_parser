RSpec::Matchers.define :be_parsed_to do |expected|
  match do |actual|
    RangeSentenceParser.parse!(actual) == expected
  end
end

RSpec::Matchers.define :be_unparsed_to do |expected|
  match do |actual|
    RangeSentenceParser.unparse!(actual) == expected
  end
end

RSpec::Matchers.define :be_a_valid_sentence do |expected|
  match do |actual|
    RangeSentenceParser.valid?(actual)
  end
end

RSpec::Matchers.define :be_an_invalid_sentence do |expected|
  match do |actual|
    RangeSentenceParser.invalid?(actual)
  end
end
