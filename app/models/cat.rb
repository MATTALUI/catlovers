class Cat < ApplicationRecord
  validates :name, presence: true, length: {minimum: 3}
  validates :description, presence: true
  has_many :comments, dependent: :destroy
end
