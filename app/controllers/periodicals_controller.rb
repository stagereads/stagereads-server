class PeriodicalsController < ApplicationController

  before_filter :authenticate, :only => [:new, :edit, :create, :update, :destroy]

  # GET /periodicals
  # GET /periodicals.json
  def index
    @periodicals = Periodical.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @periodicals }
    end
  end

  # GET /periodicals/1
  # GET /periodicals/1.json
  def show
    @periodical = Periodical.find_by_hashed_resource(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @periodical }
    end
  end

  # GET /periodicals/new
  # GET /periodicals/new.json
  def new
    @periodical = Periodical.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @periodical }
    end
  end

  # GET /periodicals/1/edit
  def edit
    @periodical = Periodical.find_by_hashed_resource(params[:id])
  end

  # POST /periodicals
  # POST /periodicals.json
  def create
    @periodical = Periodical.new(params[:periodical])

    respond_to do |format|
      if @periodical.save
        format.html { redirect_to @periodical, notice: 'Periodical was successfully created.' }
        format.json { render json: @periodical, status: :created, location: @periodical }
      else
        format.html { render action: "new" }
        format.json { render json: @periodical.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /periodicals/1
  # PUT /periodicals/1.json
  def update
    @periodical = Periodical.find_by_hashed_resource(params[:id])

    respond_to do |format|
      if @periodical.update_attributes(params[:periodical])
        format.html { redirect_to @periodical, notice: 'Periodical was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @periodical.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /periodicals/1
  # DELETE /periodicals/1.json
  def destroy
    @periodical = Periodical.find_by_hashed_resource(params[:id])
    @periodical.destroy

    respond_to do |format|
      format.html { redirect_to periodicals_url }
      format.json { head :no_content }
    end
  end

protected
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == "admin" && password == "st@ge..."
    end
  end

end
