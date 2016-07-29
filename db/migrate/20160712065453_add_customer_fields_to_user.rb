class AddCustomerFieldsToUser < ActiveRecord::Migration
  def change
	add_column :users, :first_name, :string
	add_column :users, :last_name, :string
  	add_column :users, :phone_number, :string
	add_column :users, :image, :string
  	add_column :users, :otp, :string
  	add_column :users, :gender, :string
  	add_column :users, :landmark, :string
  	add_column :users, :city, :string
  	add_column :users, :housne_no, :string
  	add_column :users, :street, :string
  	add_column :users, :api_secret, :string
  	add_column :users, :role, :integer ,:default => 0
  	add_column :users, :devise_id, :string
  	add_column :users, :devise_type, :string
  	add_column :users, :price, :float
  	add_column :users, :login_provider, :string
  	add_column :users, :verified, :boolean ,:default =>false
  	
  end
end
