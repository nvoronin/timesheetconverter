class TglRow < ActiveRecord::Base
  attr_accessible :billable, :client, :description, :email, :end_date, :start_date, :tags, :task, :usd_amount, :user_name
end
