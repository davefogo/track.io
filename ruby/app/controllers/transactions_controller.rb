class TransactionsController < ApplicationController

  def index
    @search = TransactionSearch.new(params[:search])
    @transactions = @search.scope.order(date: :asc)
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
    @transaction.update_attributes(transaction_params)

    if @transaction.save
      flash[:notice] = "Transaction successfully updated."
      redirect_to transactions_path
    else
      flash.now[:alert] = "Transaction could not be saved. Please try again."
      render :edit
    end

  end

  def destroy
    @transaction = Transaction.find(params[:id])

    if @transaction.destroy
      flash[:notice] = "Your transaction was destroyed succesfully."
      redirect_to transactions_path
    else
      flash.now[:alert] = "Your transaction could not be destroyed. Please try again."
      redirect_to transactions_path
    end
  end

  def dashboard
    @search = TransactionSearch.new(params[:search])
    @transactions = @search.scope
    @cash = @transactions.where(category: "Cash", type_of_transaction: "Expense")
    @credit = @transactions.where(category: "Credit", type_of_transaction: "Expense")
    @total = @transactions.where(type_of_transaction: "Expense")
    @surplus = @transactions.where(category: "Balance")
  end

  def cashflow
    @search = CashflowScope.new(params[:search])
    @transactions = @search.scope
    @income = @transactions.where(type_of_transaction: "Income")
    @expenses = @transactions.where(category: "Cash")
  end

  private

  def transaction_params
    params.require(:transaction).permit(:date, :amount, :type_of_transaction, :cash_balance, :credit_balance, :category)
  end
end
