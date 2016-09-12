class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)

    if @transaction.save
      flash[:notice] = "Transaction successfully created."
      redirect_to transactions_path
    else
      flash.now[:alert] = "Transaction could not be saved. Please try again."
      render :new
    end

  end

  def edit
    @transaction = Transaction.find(params[:id])
  end

  def update
    @transaction = Transaction.find(params[:id])
    @transaction.update_attributes(transaction_params)\

    if @transaction.save
      flash[:notice] = "Transaction successfully updated."
      redirect_to transactions_path
    else
      flash.now[:alert] = "Transaction could not be saved. Please try again."
      render :edit
    end

  end

  def dashboard
  end

  private

  def transaction_params
    params.require(:transaction).permit(:date, :amount, :type_of_transaction, :cash_balance, :credit_balance)
  end
end
