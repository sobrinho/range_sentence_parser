# RangeSentenceParser

Parser for range sentences like '1990; 1995-2000; 2005'.

I use it primarily for reports but can be used for anything else.

## Installation

Add this line to your application's Gemfile:

``` ruby
gem 'range_sentence_parser'
```

And then execute:

``` bash
$ bundle
```

Or install it yourself as:

``` bash
$ gem install range_sentence_parser
```

## Usage

Stand-alone:

``` ruby
RangeSentenceParser.parse!('1990; 1995-2000; 2005')
# => [1990, 1995..2000, 2005]

RangeSentenceParser.valid?('1990; 1995-2000; 2005')
# => true

RangeSentenceParser.invalid?('1990; 1995-2000; 2005')
# => false
```

Integrated with ActiveRecord:

``` ruby
class AccountingReport < ActiveRecord::Base
  validates :year_sentence, :range_sentence => true

  def years
    RangeSentenceParser.parse!(year_sentence)
  end
end

accounting_report = AccountingReport.new(:year_sentence => '1990; 1995-2000; 2005')

accounting_report.valid?
# => true

accounting_report.years
# => [1990, 1995..2000, 2005]
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
