class MatchesController < ApplicationController

  # GET /matches
  # GET /matches.json
  def index
    @season = Season.find(params[:season_id])
    @matches = @season.matches.all
    #@matches = Match.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @matches }
    end
  end

  # GET /matches/1
  # GET /matches/1.json
  def show
    if params[:season_id]
      @season = Season.find(params[:season_id])
      @match = @season.matches.find(params[:id])
    else
      @match = Match.find(params[:id])
    end
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @match }
    end
  end

  # GET /matches/new
  # GET /matches/new.json
  def new
    @season = Season.find(params[:season_id])
    @match = @season.matches.new
    @matchplayers = 8.times { @match.matchplayers.build }
    @players = Player.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @match }
    end
  end

  # GET /matches/1/edit
  def edit
    @season = Season.find(params[:season_id])
    @match = @season.matches.find(params[:id])
    #@match = Match.find(params[:id])
  end

  # POST /matches
  # POST /matches.json
  def create
    @season = Season.find(params[:season_id])
    @match = @season.matches.create(params[:match])
    #@match = Match.new(params[:match])

    respond_to do |format|
      if @match.save
        format.html { redirect_to season_match_url(@season, @match), notice: 'Match was successfully created.' }
        format.json { render json: @match, status: :created, location: @match }
      else
        format.html { render action: "new" }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /matches/1
  # PUT /matches/1.json
  def update
    @season = Season.find(params[:season_id])
    @match = @season.matches.find(params[:id])
    #@match = Match.find(params[:id])

    respond_to do |format|
      if @match.update_attributes(params[:match])
        format.html { redirect_to season_match_url(@season, @match), notice: 'Match was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matches/1
  # DELETE /matches/1.json
  def destroy
    @season = Season.find(params[:season_id])
    @match = @season.matches.find(params[:id])
    #@match = Match.find(params[:id])
    @match.destroy

    respond_to do |format|
      format.html { redirect_to season_matches_url(@season) }
      format.json { head :no_content }
    end
  end

  def players_by_team
    if params[:id].present?
      # Populating players based on team
      players = Playerbond.where("team_id = #{params[:id]}").map(&:player_id)
      @players = Player.find(:all, :conditions=>["id in (?)", players])
    else
      @players = []
    end
    @team_no = params[:team_no] if params[:team_no].present?

    respond_to do |format|
      format.js
    end
  end
  
  
  
  end