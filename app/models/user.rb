class User < ApplicationRecord
  acts_as_token_authenticatable
  # devise :database_authenticatable, :registerable,
	# 	:jwt_authenticatable, jwt_revocation_strategy: JwtDenylist
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
