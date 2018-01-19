class Serial < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  has_many :users_serial, dependent: :destroy
end
