class IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    date = Time.now
    amount = params["stripped-text"]
    type_of_transaction = [:subject]
    category = params["stripped-signature"]
    category.gsub!("--", "")
    category.strip!

    transaction = Transaction.new(date: date, amount: amount, type_of_transaction: type_of_transaction, category: category)
    transaction.save!

    head 200
  end
end
