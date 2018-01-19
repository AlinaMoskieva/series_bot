class User < ApplicationRecord
  validates :name, :chat_id, presence: true
  has_many :users_serials, dependent: :destroy
end
