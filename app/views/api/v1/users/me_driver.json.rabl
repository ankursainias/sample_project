collection @user
attributes :api_secret,:id,:avg_rating,:user_name,:email,:phone_number,:image,:vehicle_type_id,:vehicle_model,:license,:insurance, :bank_name,:acc_holder_name, :acc_no, :routing_no
child @vehicle_type , :object_root => false do
attributes :id,:name
end