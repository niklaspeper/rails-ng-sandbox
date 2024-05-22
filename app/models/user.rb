# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #
  # modified the normal devise user model for API authentication by adding the JWT token
  # authenticatable module and defining the token revocation strategy
  # to use JwtDenylist
  devise :database_authenticatable, :registerable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  has_many :articles, dependent: :destroy
end
