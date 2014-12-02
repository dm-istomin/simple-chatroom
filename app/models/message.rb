class Message < ActiveRecord::Base
  belongs_to :sender, class_name: "User", foreign_key: "user_id"

  validates :sender, presence: true
end
