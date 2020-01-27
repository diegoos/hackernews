# frozen_string_literal: true

module ApplicationHelper
  # Format date
  def format_date(timestamp)
    Time.at(timestamp).strftime('%m/%d/%Y %H:%M')
  end
end
