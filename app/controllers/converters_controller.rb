class ConvertersController < ApplicationController
  def weekly
  end

  def daily
  end

  def upload_tgl_daily_csv
    require 'fileutils'
    require 'csv'

    # need to find better way to instanciate dates
    csv_end_date = DateTime.parse('01.01.2015')
    csv_start_date = DateTime.parse('01.01.1999') # I would be be surprised if anyone would have problems with tis software in 2 years


    tmp = params[:upload][:file].tempfile

    file = File.join("public", params[:upload][:file].original_filename)

    FileUtils.cp tmp.path, file

    csv_text = File.read(file)
    csv = CSV.parse(csv_text, :headers => true)

    # add CSV records to DB without duplicates
    csv.each do |row|
        l = row.to_hash

        # get synthetic key
        start_date = DateTime.parse(l['Start date'] + ' ' + l['Start time'])
        end_date = DateTime.parse(l['End date'] + ' ' + l['End time'])

        # check if record exits
        db_rows = TglRow.where("start_date = :start_date AND end_date = :end_date",
                     {:start_date => start_date, :end_date => end_date })

        # destroy dulpicates
        if db_rows.any?
          db_rows.each do |r| r.destroy end
        end

        tgl_row = TglRow.new(billable: l['Billable'], client: l['Client'], description: l['Description'],
            email: l['Email'], end_date: end_date,
            start_date: start_date, tags: l['Tags'],
            task: l['Task'], usd_amount: l['Amount (USD)'], user_name: l['User'])

        if not tgl_row.save
          format.json { render json: tgl_row.errors, status: :unprocessable_entity }
        end

        csv_start_date = start_date if csv_start_date < start_date
        csv_end_date = end_date if csv_end_date > end_date
    end

    FileUtils.rm file
    redirect_to :action => 'view', :date_to_show_start => csv_start_date, :date_to_show_end => csv_end_date
    end


  def view

    @date_to_show_start = params[:date_to_show_start]
    @date_to_show_end = params[:date_to_show_end]

    @tgl_rows = TglRow.where("strftime('%s',start_date) <= strftime('%s',:start_date) AND strftime('%s',end_date) >= strftime('%s',:end_date)",
                         {:start_date => params[:date_to_show_start], :end_date => params[:date_to_show_end] })
    #metrics
    f = @tgl_rows.first
    @total_hours = 0.0
    @tgl_rows.each do |t| @total_hours = @total_hours + t.activity_duration end
    @total_hours = @total_hours.round(2)
    render
  end

end
