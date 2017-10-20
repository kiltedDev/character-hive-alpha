class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :username, presence: true, uniqueness: true, length: {minimum: 6, maximum: 24}, format: { with: /^\w+$/, multiline: true }
  validates :email, presence: true, format: { with: /\A^([^@\s]+)@((?:[-a-z0-9]+.)+[a-z]{2,})$\z/i, multiline: true }
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         devise :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_omniauth(access_token)
     data = access_token.info
     user = User.where(email: data['email']).first

     # Uncomment the section below if you want users to be created if they don't exist
     # unless user
     #     user = User.create(name: data['name'],
     #        email: data['email'],
     #        password: Devise.friendly_token[0,20]
     #     )
     # end
     user
  end
end
