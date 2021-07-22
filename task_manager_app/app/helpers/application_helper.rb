module ApplicationHelper
	def format_date(date)
    if date.present?
      date.to_date.strftime('%d/%m/%Y')
    else
      '--'
    end
  end
end
