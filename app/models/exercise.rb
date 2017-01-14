class Exercise < ApplicationRecord
  belongs_to :user
  # to match the names we have on our exercises form
  alias_attribute :workout_details, :workout
  alias_attribute :activity_date, :workout_date

  validates :duration_in_min, numericality: { greater_than: 0.0 }
  validates :workout_details, presence: true
  validates :activity_date, presence: true

  default_scope { where('workout_date > ?', 7.days.ago)
                  .order(workout_date: :desc) }

  # scope :last_week, -> () { where('workout_date > ?', 7.days.ago) }
  # scope :desc_date, -> () { order(workout_date: :desc) }
end
