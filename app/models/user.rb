class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable

  field :full_name, type: String
  field :email, type: String, default: ""
  field :encrypted_password, type: String, default: ""
  field :reset_password_token, type: String
  field :reset_password_sent_at, type: DateTime
  field :remember_created_at, type: DateTime
  field :confirmation_token, type: String
  field :confirmed_at, type: DateTime
  field :confirmation_sent_at, type: DateTime
  field :unconfirmed_email, type: String
  field :sign_in_count, type: Integer, default: 0
  field :current_sign_in_at, type: DateTime
  field :last_sign_in_at, type: DateTime
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip, type: String

  validates :full_name, presence: true
end
