class Cartoon < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :description, presence: true
end
