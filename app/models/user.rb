class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many  :orders
  has_many :line_items, through: :orders
  mount_uploader :image, AvatarUploader
  after_update :send_otp

    def check_valid_otp(otp_re)
        if self.otp == otp_re
          self.update_attributes(:ver)
        end
    end

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
  private

  def send_otp
    puts  "send otprrrrr"
    random_token = SecureRandom.hex(6)
    random_token = "123456"
    self.update_attributes(:otp=> random_token,:verified=>false)  if phone_number_changed? && otp.blank?
  end


end
