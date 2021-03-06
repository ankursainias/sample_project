class Api::V1::ApplicationController < ActionController::API
	before_filter :set_prequest

	skip_before_action :verify_authenticity_token
	before_action :authenticate_api_user
	before_action :verified_user 






	def set_prequest
	headers['Access-Control-Allow-Origin'] = '*'
	headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
	headers['Access-Control-Request-Method'] = '*'
	headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
		
	end



	def authenticate_api_user
		begin

			@current_api_user=User.find_by_api_secret(request.headers["HTTP_APISECRET"])			
			raise "user_not_found" if @current_api_user.nil?
		rescue Exception => @e
			render "api/v1/commons/error"
		end
	end

	def verified_user
		if @current_api_user.present?
			raise "phone_number_not_verified" unless @current_api_user.verified
		end
	end
end


