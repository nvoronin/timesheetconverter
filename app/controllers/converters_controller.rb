class ConvertersController < ApplicationController
  def weekly
  end

  def daily
  end

  def upload_tgl_daily_csv
    require 'fileutils'
    require 'csv'
    tmp = params[:upload][:file].tempfile

    file = File.join("public", params[:upload][:file].original_filename)

    FileUtils.cp tmp.path, file

        csv_text = File.read(file)

        csv = CSV.parse(csv_text, :headers => true)

        csv.each do |row|
            l = row.to_hash
            TglRow.new(billable: l['Billable'], client: l['Client'], description: l['Description'], email: l['Email'], end_date: DateTime.parse(l['End date'] + ' ' + l['End time']), start_date: DateTime.parse(l['Start date'] + ' ' + l[08:33:00]), tags: l['Tags'], task: l['Task'], usd_amount: l['Amount (USD)'], user_name: l['User'])
        end

    FileUtils.rm file


  end
end
