class PlayerbondsController < ApplicationController
  # GET /playerbonds
  # GET /playerbonds.json
  def index
    @season = Season.find(params[:season_id])
    @playerbonds = @season.playerbonds.all(:order => "team_id")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @playerbonds }
    end
  end

  # GET /playerbonds/1
  # GET /playerbonds/1.json
  def show
    @season = Season.find(params[:season_id])
    @playerbond = @season.playerbonds.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @playerbond }
    end
  end

  # GET /playerbonds/new
  # GET /playerbonds/new.json
  def new
    @season = Season.find(params[:season_id])
    @playerbond = @season.playerbonds.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @playerbond }
    end
  end

  # GET /playerbonds/1/edit
  def edit
    @season = Season.find(params[:season_id])
    @playerbond = @season.playerbonds.find(params[:id])
  end

  # POST /playerbonds
  # POST /playerbonds.json
  def create
    @season = Season.find(params[:season_id])
    @playerbond = @season.playerbonds.create(params[:playerbond])

    respond_to do |format|
      if @playerbond.save
        #format.html { redirect_to @playerbond, notice: 'Playerbond was successfully created.' }
        #format.json { render json: @playerbond, status: :created, location: @playerbond }
        format.html { redirect_to season_playerbonds_url(@season) }
        format.json { render json: @playerbonds }
      else
        format.html { render action: "new" }
        format.json { render json: @playerbond.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /playerbonds/1
  # PUT /playerbonds/1.json
  def update
    @season = Season.find(params[:season_id])
    @playerbond = @season.playerbonds.find(params[:id])

    respond_to do |format|
      if @playerbond.update_attributes(params[:playerbond])
        format.html { redirect_to season_playerbonds_url(@season), notice: 'Playerbond was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @playerbond.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /playerbonds/1
  # DELETE /playerbonds/1.json
  def destroy
    @playerbond = Playerbond.find(params[:id])
    @playerbond.destroy

    respond_to do |format|
      format.html { redirect_to playerbonds_url }
      format.json { head :no_content }
    end
  end
end
