require 'rails_helper'

RSpec.describe TransactionsController, type_of_transaction: :controller do
  let(:my_transaction) { create(:transaction) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "renders the index view" do
      get :index
      expect(response).to render_template(:index)
    end

    it "assigns my_transaction to @transactions" do
      get :index
      expect(assigns(:transactions)).to eq([my_transaction])
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the new view" do
      get :new
      expect(response).to render_template(:new)
    end

    it "instantiates @transaction" do
      get :new
      expect(assigns(:transaction)).to_not be_nil
    end
  end

  describe "POST #create" do
    it "creates a transaction" do
      expect{post :create, transaction: {}}.to change(Transaction, :count).by(1)
    end

    it "assigns the new transaction to @transaction" do
      post :create, transaction: {}
      expect(assigns(:transaction)).to eq(Transaction.last)
    end

    it "redirects to the index view" do
      post :create, transaction: {}
      expect(response).to redirect_to transactions_path
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, id: my_transaction.id
      expect(response).to have_http_status(:success)
    end

    it "renders the edit view" do
      get :edit, id: my_transaction.id
      expect(response).to render_template(:edit)
    end

    it "assigns my_transaction to @transaction to be updated" do
      get :edit, id: my_transaction.id

      my_transaction_instance = assigns(:transaction)

      expect(my_transaction_instance.id).to eq(my_transaction.id)
      expect(my_transaction_instance.date).to eq(my_transaction.date)
      expect(my_transaction_instance.amount).to eq(my_transaction.amount)
    end
  end

  describe "PUT #update" do
    it "updates transaction with expected attributes" do
      new_type_of_transaction = "Credit Card"
      new_amount = 200_000

      put :update, id: my_transaction.id, transaction: { type_of_transaction: new_type_of_transaction, amount: new_amount }

      updated_transaction = assigns(:transaction)
      expect(updated_transaction.id).to eq(my_transaction.id)
      expect(updated_transaction.type_of_transaction).to eq(new_type_of_transaction)
      expect(updated_transaction.amount).to eq(new_amount)
    end

    it "redirects to transactions index" do
      new_type_of_transaction = "Credit Card"
      new_amount = 200_000

      put :update, id: my_transaction.id, transaction: { type_of_transaction: new_type_of_transaction, amount: new_amount }
      expect(response).to redirect_to transactions_path
    end
  end

  # describe "GET #dashboard" do
  #   it "returns http success" do
  #     get :dashboard
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
