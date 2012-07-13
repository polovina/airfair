class InputsController < ApplicationController
  before_filter :authenticate_user!
  before_filter do
  @input = Input.find_by_user_id(current_user.id)
  end
  
  def start
  @input.update_attributes(:updated_at => (Time.now - @input.interval.hours.to_i), :active=>true)
  #flash[:notice]="will process in a minute"
  redirect_to outputs_url
  end
  
  def stop
  @input.update_attributes(:active=>false)
  #flash[:notice]="not active"
  redirect_to outputs_url
  end
  
  
  # GET /inputs
  # GET /inputs.json
  
  def index
      @inputs = Input.all
      respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @inputs }
    end
  end

  # GET /inputs/1
  # GET /inputs/1.json
  def show
    @input = Input.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @input }
    end
  end

  # GET /inputs/new
  # GET /inputs/new.json
  def new
    @input = Input.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @input }
    end
  end

  # GET /inputs/1/edit
  def edit
    @input = Input.find(params[:id])
  end

  # POST /inputs
  # POST /inputs.json
  def create
    @input = Input.new(params[:input].merge!(:user => current_user))
    respond_to do |format|
      if @input.save
        format.html { redirect_to @input, notice: 'Input was successfully created.' }
        format.json { render json: @input, status: :created, location: @input }
      else
        format.html { render action: "new" }
        format.json { render json: @input.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /inputs/1
  # PUT /inputs/1.json
  def update
    #@input = Input.find(params[:id])

    respond_to do |format|
      if @input.update_attributes(params[:input])
      
        format.html { redirect_to outputs_path, notice: 'Input was successfully updated.' }
        format.json { head :ok }
        format.js {@updates=params[:input].keys}
      else
        format.html { render action: "edit" }
        format.json { render json: @input.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inputs/1
  # DELETE /inputs/1.json
  def destroy
    @input = Input.find(params[:id])
    @input.destroy

    respond_to do |format|
      format.html { redirect_to inputs_url }
      format.json { head :ok }
    end
  end
end
