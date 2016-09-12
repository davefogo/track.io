FactoryGirl.define do
  factory :transaction do
    date "2016-09-11"
    amount 1_000
    type_of_transaction "Cash"
    category "Groceries"
    cash_balance 1
    credit_balance 1
    total 1
  end
end
