class Book < ApplicationRecord
  belongs_to :library
  belongs_to :user, optional: true

  validates :title, presence: true
  validates :available, inclusion: { in: [true, false] }
end
