class Message < ApplicationRecord
  validates :text, presence: true , length: { maximum: 30 }
end
