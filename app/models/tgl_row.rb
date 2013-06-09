class TglRow < ActiveRecord::Base
  attr_accessible :billable, :client, :description, :email, :end_date, :start_date, :tags, :task, :usd_amount, :user_name

  def activity_duration
      return ((self.end_date - self.start_date) / 3600.0).round(2)
  end
end
