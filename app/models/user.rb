class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[github]
  # validates :first_name, presence: true
  has_many :carts, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_one :comment

  def self.from_omniauth(authorize_params)
    user = User.find_by(uid: authorize_params.fetch('uid'))

    if user.present?
      user
    else
      create!(
        uid: authorize_params.fetch('uid'),
        email: authorize_params.fetch('info').fetch('email'),
        nickname: authorize_params.fetch('info').fetch('nickname'),
        first_name: authorize_params.fetch('info').fetch('name'),
        password: Devise.friendly_token[0, 20]
      )

    end
  end
end

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  first_name             :string
#  last_name              :string
#
