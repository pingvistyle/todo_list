class Task < ApplicationRecord
  belongs_to :user

  scope :todo, -> { where(completed: false) }
  scope :completed, -> { where(completed: true) }
end
