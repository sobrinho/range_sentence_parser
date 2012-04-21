require 'spec_helper'

describe RangeSentenceValidator do
  subject do
    AccountingReport.new
  end

  context 'using valid sentence' do
    before do
      subject.stub(:year_sentence).and_return('1990; 1995-2000; 2005')
    end

    it { should be_valid }
  end

  context 'using invalid sentence' do
    before do
      subject.stub(:year_sentence).and_return('1990, 1995-2000, 2005')
    end

    it { should be_invalid }
  end
end
