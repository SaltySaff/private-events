class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  
  has_many :attending_events
  has_many :attendees, through: :attending_events, source: :user
  
  has_many :invitations
  has_many :invitees, through: :invitations, source: :user

  scope :past, -> { where('date < ?', Time.now) }
  scope :future, -> { where('date > ?', Time.now) }
end
