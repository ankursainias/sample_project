class Api::V1::UsersController < Api::V1::ApplicationController
before_action :sanitize_params , only: [:sign_up]
before_action :authenticate_api_user , except: [:sign_up,:sign_in]

		def sign_in
		  begin
				user = User.find_by_email(params[:user][:email])
				raise "Email not valid" if user.nil?
				if user.valid_password?(params[:user][:password])
					user.create_token if user.api_secret.blank?
					@user=user
					@current_api_user=user
					render :me
				else 
					raise "Password Not valid"	
				end
		  rescue Exception => e
				err_hash={}
				err_hash[:error]=e.message
				render :json => err_hash.to_json
		  end  	
		end
		api :GET, '/api/v1/me', 'Detail of current login user '
		def me
			@user=@current_api_user
		end
		
		api :POST, '/api/v1/users/update', 'update user imformation'
		  	param :user, Hash, required: true, desc: "" do
		    param :user_name, String, required: false, desc: "user_name of the current user"
		    param :phone_number, String, required: false, desc: "Phone number of the current user"
		end
		
		def update
			begin
				@current_api_user.update_attributes(signup_params_customer)
				@current_api_user.image_data_uri = params[:user][:image] if params[:user][:image].present? 
				@current_api_user.save
				@user=@current_api_user
				render :me		
			rescue Exception => e
				err_hash={}
				err_hash[:error]=e.message
				render :json => err_hash.to_json
			end
		end
		
		def sign_up
			begin
				if @role == "customer"
					@user=User.create!(signup_params_customer)
					@user.create_token
					render :me
				else
					@user=User.create!(signup_params_driver)
					@user.create_token
					render :me_driver
				end
		 	rescue Exception => e
		 		puts "error_exception #{Time.now} #{e.message}"
				err_hash={}
				err_hash[:error]=e.message
				render :json => err_hash.to_json  
		 	end
		end

	private
		def signup_params_customer
			params.require(:user).permit(:devise_id,:devise_type,:phone_number,:role,:email,:password,:image,:first_name,:last_name,:city,:housne_no,:landmark,:street)
		end


		def sanitize_params
			begin
				if params.dig(:user, :role).present?
						
					if  params.dig(:user, :role) == 0 || params.dig(:user, :role) == "0"
						@role= "customer"					
					elsif  params.dig(:user, :role) == 1 || params.dig(:user, :role) == "1"
						@role= "driver"
					else
						raise "invalid role"
					end
				else
					raise "Please add role"
				end				
			rescue Exception => @e
				puts "error_exception #{Time.now} #{@e.message}"
				render "api/v1/commons/error"
			end

		end

end