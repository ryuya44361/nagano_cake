class Public::CustomersController < ApplicationController
  
  def show
    @customer = current_customer
  end
  
  def edit
  end
  
  def updaate
  end
  
  def secession
    @customer = current_customer
  end
  
  def change
  end
  
  private

  def customer_params
    params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:email,:postal_code,:address,:telephone_number,:is_deleted)
  end
  
end
