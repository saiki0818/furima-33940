class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 has_many :products
 has_many :buyers   
       
 validates :nickname, presence: true
 validates :last_name, presence: true
 validates :first_name, presence: true 
 validates :last_name_kana, presence: true
 validates :first_name_kana, presence: true
 validates :birthday, presence: true
 validates :encrypted_password,:password,:password_confirmation,format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/}

end
