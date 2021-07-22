class Task < ApplicationRecord
	
	include AASM
	
	validates :name,:code,:start_date, :end_date, :user_id, presence: true
  validates :code, uniqueness: true
  validate :end_date_after_start_date?

	aasm column: :status do
    state :pending, initial: true
    state :inprogress
    state :completed
    state :paused
    event :start do
      transitions from: %i[pending paused], to: :inprogress
    end
    event :pausing do
      transitions from: %i[completed], to: :paused
    end
    event :complete do
      transitions from: %i[inprogress], to: :completed
    end
  end

  def end_date_after_start_date?
    if (end_date.present? && start_date.present?)
      errors.add :end_date, "must be after start date" if end_date < start_date
    end
  end

end
