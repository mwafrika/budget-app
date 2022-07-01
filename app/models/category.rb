class Category < ApplicationRecord
  belongs_to :user
  has_many :transancts, dependent: :destroy
  validates :name, :icon, presence: true
end
