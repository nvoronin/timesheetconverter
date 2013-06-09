class CreateTglRows < ActiveRecord::Migration
  def change
    create_table :tgl_rows do |t|
      t.string :user_name
      t.string :email
      t.string :client
      t.string :task
      t.string :description
      t.boolean :billable
      t.datetime :start_date
      t.datetime :end_date
      t.string :tags
      t.decimal :usd_amount

      t.timestamps
    end
  end
end
