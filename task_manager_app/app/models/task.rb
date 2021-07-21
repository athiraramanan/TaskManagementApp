class Task < ApplicationRecord
	
	include AASM
	
	validates :name,:start_date, :end_date, :user_id, presence: true

	aasm column: :status do
    state :pending, initial: true
    state :inprogress
    state :completed
    event :start do
      transitions from: %i[pending], to: :inprogress
    end
    event :complete do
      transitions from: %i[inprogress], to: :completed
    end
  end

end
