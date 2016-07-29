class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many  :orders
  has_many :line_items, through: :orders
  mount_uploader :image, AvatarUploader


    def create_token
      random_token = SecureRandom.hex(10)
       check=User.find_by_api_secret(random_token)
       if check.present?
          return create_token
       else
        self.update_attributes(:api_secret=> random_token)
       end
   	end


    def avg_rating
      return (1..5).to_a.sample
    end



end
