class Job < ApplicationRecord
# job association:
  has_and_belongs_to_many :boats
# job model validations:
  validates :name, uniqueness: true

  validates :description, length: { minimum: 50 }
  validates :cost, numericality: { greater_than_or_equal_to: 1000 }
end
