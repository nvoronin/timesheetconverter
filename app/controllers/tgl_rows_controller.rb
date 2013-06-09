class TglRowsController < ApplicationController
  # GET /tgl_rows
  # GET /tgl_rows.json
  def index
    @tgl_rows = TglRow.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tgl_rows }
    end
  end

  # GET /tgl_rows/1
  # GET /tgl_rows/1.json
  def show
    @tgl_row = TglRow.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tgl_row }
    end
  end

  # GET /tgl_rows/new
  # GET /tgl_rows/new.json
  def new
    @tgl_row = TglRow.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tgl_row }
    end
  end

  # GET /tgl_rows/1/edit
  def edit
    @tgl_row = TglRow.find(params[:id])
  end

  # POST /tgl_rows
  # POST /tgl_rows.json
  def create
    @tgl_row = TglRow.new(params[:tgl_row])

    respond_to do |format|
      if @tgl_row.save
        format.html { redirect_to @tgl_row, notice: 'Tgl row was successfully created.' }
        format.json { render json: @tgl_row, status: :created, location: @tgl_row }
      else
        format.html { render action: "new" }
        format.json { render json: @tgl_row.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tgl_rows/1
  # PUT /tgl_rows/1.json
  def update
    @tgl_row = TglRow.find(params[:id])

    respond_to do |format|
      if @tgl_row.update_attributes(params[:tgl_row])
        format.html { redirect_to @tgl_row, notice: 'Tgl row was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tgl_row.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tgl_rows/1
  # DELETE /tgl_rows/1.json
  def destroy
    @tgl_row = TglRow.find(params[:id])
    @tgl_row.destroy

    respond_to do |format|
      format.html { redirect_to tgl_rows_url }
      format.json { head :no_content }
    end
  end
end
