module ApplicationHelper
  def formatted_time(runtime)
    hours = runtime / 60
    minutes = runtime % 60
    "#{hours}hours and #{minutes}minutes"
  end
end
