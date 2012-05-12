class RangeSentenceValidator < ActiveModel::EachValidator
  # Validates whether the value of the specified attribute is of the correct form for RangeSentenceParser.
  #
  # Usage:
  #
  #   class AccountingReport
  #     include ActiveModel::Validations
  #
  #     validates :year_sentence, :range_sentence => true
  #   end
  def validate_each(record, attribute, value)
    record.errors.add(attribute) if RangeSentenceParser.invalid?(value)
  end
end
