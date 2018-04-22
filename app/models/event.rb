class Event < ApplicationRecord
  belongs_to :host, class_name: "User", foreign_key: :host_id, inverse_of: :hosted_events, optional: true
  has_many :attendees, class_name: "User", through: :tickets, source: :user
  has_many :tickets, dependent: :destroy
  has_many :categories
end
