class Board < ApplicationRecord
  MIN_HEIGHT = 2
  MIN_WIDTH = 2
  MIN_BOMBS = 1

  validates :name, presence: true
  validates :email, presence: true

  validates :height, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: MIN_HEIGHT }
  validates :width, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: MIN_WIDTH }
  validates :bombs, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: MIN_BOMBS }
end
