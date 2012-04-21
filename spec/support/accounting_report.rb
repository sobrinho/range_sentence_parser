class AccountingReport
  include ActiveModel::Validations

  validates :year_sentence, :range_sentence => true
end
