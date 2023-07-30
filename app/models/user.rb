# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_person_name
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:github]

  def self.from_omniauth(auth)
    logger.debug auth
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      logger.debug user
      user.name = auth.info.name
      user.nickname = auth.info.nickname
      user.image = auth.info.image
      user.profile_url = auth.info.urls.GitHub
      user.email = auth.info.email if auth.info.email.present?
      user.password = Devise.friendly_token[0, 20]
    end
  end

  has_many :team_users
  has_many :teams, through: :team_users
end
