class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :hosted_events, class_name: "Event", inverse_of: :host,
   foreign_key: :host_id, dependent: :destroy

  has_many :tickets, dependent: :destroy
  has_many :attended_events, class_name: "Event", through: :tickets,
   source: :event
end
