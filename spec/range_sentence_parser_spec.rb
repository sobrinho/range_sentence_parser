require 'spec_helper'

describe RangeSentenceParser do
  context '.parse!' do
    it 'parses empty string' do
      ''.should be_parsed_to []
    end

    it 'parses one number' do
      '1990'.should be_parsed_to [1990]
    end

    it 'parses many numbers' do
      '1990; 1995'.should be_parsed_to [1990, 1995]
    end

    it 'parses one range' do
      '1990-1995'.should be_parsed_to [1990..1995]
    end

    it 'parses many ranges' do
      '1990-1995; 2000-2005'.should be_parsed_to [1990..1995, 2000..2005]
    end

    it 'parses one number and one range' do
      '1990; 1995-2000'.should be_parsed_to [1990, 1995..2000]
    end

    it 'parses many numbers and many ranges' do
      '1990; 1995-2000; 2005; 2010-2015'.should be_parsed_to [1990, 1995..2000, 2005, 2010..2015]
    end

    it 'do not cares about inner spaces' do
      '1990;  1995-2000;  2005;  2010-2015'.should be_parsed_to [1990, 1995..2000, 2005, 2010..2015]
      '1990;1995-2000;2005;2010-2015'.should be_parsed_to [1990, 1995..2000, 2005, 2010..2015]
    end

    it 'do not cares about last semicolon' do
      '1990;'.should be_parsed_to [1990]
      '1990; 1995-2000; 2005; 2010-2015;'.should be_parsed_to [1990, 1995..2000, 2005, 2010..2015]
    end

    it 'raises an error for invalid sentences' do
      expect { described_class.parse!('1990..1995') }.to raise_error RangeSentenceParser::InvalidSentenceError
      expect { described_class.parse!('1990, 1995, 2000') }.to raise_error RangeSentenceParser::InvalidSentenceError
    end
  end

  context 'unparse!' do
    it 'unparses an empty array' do
      [].should be_unparsed_to ''
    end

    it 'unparses one number' do
      [1990].should be_unparsed_to '1990'
    end

    it 'unparses numbers' do
      [1990, 1995].should be_unparsed_to '1990; 1995'
    end

    it 'unparses one range' do
      [1990..1995].should be_unparsed_to '1990-1995'
    end

    it 'unparses ranges' do
      [1990..1995, 2000..2005].should be_unparsed_to '1990-1995; 2000-2005'
    end

    it 'unparses one number and one range' do
      [1990, 1995..2000].should be_unparsed_to '1990; 1995-2000'
    end

    it 'unparses numbers and ranges' do
      [1990, 1995..2000, 2005, 2010..2015].should be_unparsed_to '1990; 1995-2000; 2005; 2010-2015'
    end
  end

  context '#valid?' do
    it 'should be for valid sentences' do
      ''.should be_a_valid_sentence
      '1990'.should be_a_valid_sentence
      '1990; 1995'.should be_a_valid_sentence
      '1990-1995'.should be_a_valid_sentence
      '1990-1995; 2000-2005'.should be_a_valid_sentence
      '1990; 1995-2000; 2005; 2010-2015'.should be_a_valid_sentence
    end
  end

  context '#invalid?' do
    it 'should be for invalid sentences' do
      '1990..1995'.should be_an_invalid_sentence
      '1990, 1995, 2000'.should be_an_invalid_sentence
      "1990\n1995".should be_an_invalid_sentence
    end
  end
end
