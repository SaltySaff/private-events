class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :created_events, foreign_key: "creator_id", class_name: "Event", dependent: :destroy
  
  has_many :attending_events, dependent: :destroy
  has_many :attended_events, through: :attending_events, source: :event, foreign_key: "attendee_id"
  
  has_many :invitations, dependent: :destroy
  has_many :invited_events, through: :invitations, source: :event, foreign_key: "invitee_id"
end
