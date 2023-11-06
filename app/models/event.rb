class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :attendee_events, foreign_key: 'attended_event_id'
  has_many :attendees, through: :attendee_events

  scope :past, -> { where('date < ?', Date.today).order(date: :desc) } 
  scope :upcoming, -> { where('date > ?', Date.today).order(:date) }
end

