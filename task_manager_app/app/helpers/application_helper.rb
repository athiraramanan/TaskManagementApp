module ApplicationHelper
	def format_date(date)
    if date.present?
      date.to_date.strftime('%d/%m/%Y')
    else
      '--'
    end
  end
  def date_of_remaining(task)
  	remaining_days = (task.end_date.to_date - Time.zone.today.to_date).to_i
  	if remaining_days.positive?
  		remaining_days.abs.to_s + ' days remaining to finish the task'
    elsif remaining_days.zero?
      'Last day to finish the task'
  	else
  		remaining_days.abs.to_s + ' days late'
  	end
  end
end
