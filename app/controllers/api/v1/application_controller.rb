class Api::V1::ApplicationController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :authenticate_api_user

	def authenticate_api_user
		begin
			@current_api_user=User.find_by_api_secret(request.headers["HTTP_APISECRET"])			
			raise "user_not_found" if @current_api_user.nil?
		rescue Exception => @e
			render "api/v1/commons/error"
		end
	end





end


