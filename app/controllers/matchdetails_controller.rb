class MatchdetailsController < ApplicationController
  # GET /matchdetails
  # GET /matchdetails.json
  def index
    if params[:season_id]
      @season = Season.find(params[:season_id])
      @match = @season.matches.find(params[:match_id])
    else
      @match = Match.find(params[:match_id])
      @season = @match.season
    end
    @matchdetails = @match.matchdetails.all
    
    @batting = Battingperformance.all
    @bowling = Bowlingperformance.all
    #@matchdetails = Matchdetail.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @matchdetails }
    end
  end

  # GET /matchdetails/1
  # GET /matchdetails/1.json
  def show
    if params[:season_id]
      @season = Season.find(params[:season_id])
      @match = @season.matches.find(params[:match_id])
    elsif params[:match_id]
      @match = Match.find(params[:match_id])
      @season = @match.season
    else
      @matchdetail = Matchdetail.find(params[:id]) 
      @match = Match.find(@matchdetail.match)
    end
    
    
    @matchdetail = @match.matchdetails.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @matchdetail }
    end
  end

  # GET /matchdetails/new
  # GET /matchdetails/new.json
  def new
    if params[:season_id]
      @season = Season.find(params[:season_id])
      @match = @season.matches.find(params[:match_id])
    else
      @match = @season.matches.find(params[:match_id])
      @season = @match.season
    end
    @matchdetail = @match.matchdetails.new
    @innings = @match.matchdetails.count + 1
    
    # To identify the batting team and bowling team
    if (@match.matchdetails.count == 0) then
      if @match.tossselection.id == 1
        bat_team = (@match.team_one == @match.toss_won) ? @match.team_one : @match.team_two
        bowl_team = (@match.team_one == bat_team) ? @match.team_two : @match.team_one
      elsif @match.tossselection.id == 2
        bowl_team = (@match.team_one == @match.toss_won) ?  @match.team_one : @match.team_two
        bat_team = (@match.team_one == bowl_team) ? @match.team_two : @match.team_one
      end
    elsif (@match.matchdetails.count == 1)
      bowl_team = @match.matchdetails.first.bat_team
      bat_team = @match.matchdetails.first.bowl_team
    end
    @matchdetail.bat_team = bat_team
    @matchdetail.bowl_team = bowl_team

    # Populating players for batting team
    playerbonds = Playerbond.where("team_id = #{bat_team.id}")
    @bat_players = []
    playerbonds.each do |pb|
      @bat_players << Player.find(pb.player_id)
    end
    
    # Populating players for bowling team
    playerbonds = Playerbond.where("team_id = #{bowl_team.id}")
    @bowl_players = []
    playerbonds.each do |pb|
      @bowl_players << Player.find(pb.player_id)
    end
    
    # Building attributes of Batting Performaces
    count = 0
    8.times do 
      batperf = @matchdetail.battingperformances.build
      batperf.update_attribute(:bat_order, count + 1)
      count += 1
    end
    
    # Building attributes of Bowling Performaces
    count = 0
    7.times do 
      bowlperf = @matchdetail.bowlingperformances.build
      bowlperf.update_attribute(:over_no, count + 1)
      count += 1
    end
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @matchdetail }
    end
  end

  # GET /matchdetails/1/edit
  def edit
    @matchdetail = Matchdetail.find(params[:id])
  end

  # POST /matchdetails
  # POST /matchdetails.json
  def create
    @match = Match.find(params[:match_id])
    @season = @match.season
    @matchdetail = @match.matchdetails.create(params[:matchdetail])
    calculate_score
    
    respond_to do |format|
      if @matchdetail.save
        format.html { redirect_to season_match_matchdetails_url(@season, @match), notice: 'Matchdetail was successfully created.' }
        format.json { render json: @matchdetail, status: :created, location: @matchdetail }
      else
        format.html { render action: "new" }
        format.json { render json: @matchdetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /matchdetails/1
  # PUT /matchdetails/1.json
  def update
    @matchdetail = Matchdetail.find(params[:id])

    respond_to do |format|
      if @matchdetail.update_attributes(params[:matchdetail])
        format.html { redirect_to @matchdetail, notice: 'Matchdetail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @matchdetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matchdetails/1
  # DELETE /matchdetails/1.json
  def destroy
    if params[:season_id]
      @season = Season.find(params[:season_id])
      @match = @season.matches.find(params[:match_id])
    else
      @match = Match.find(params[:match_id])
      @season = @match.season
    end
    
    @matchdetail = Matchdetail.find(params[:id])
    @matchdetail.destroy

    respond_to do |format|
      format.html { redirect_to season_match_matchdetails_url(@season,@match) }
      format.json { head :no_content }
    end
  end

  def calculate_score
    # puts ("-----------Score--------")
    
    # Calculating Batting Performances
    # puts ("-----------Calculating Batting Performances--------")
    bat_wick = 0
    @matchdetail.score = 0
    @matchdetail.battingperformances.each do |batperf|
      # puts ("Batsman")
      # puts (batperf.batsman_id)
      if batperf.batsman_id
        score_arr = batperf.score_seq.gsub(/[bp]/,"").split(",").map{|s| s.to_i} 
        batperf.runs = score_arr.reduce(:+)
        @matchdetail.score += batperf.runs
        puts (batperf.wicketmode_id)
        bat_wick += 1 if batperf.wicketmode_id.to_s !~ /[67]/
        puts (bat_wick)
      else
        batperf.destroy
      end
    end
    @matchdetail.extras = 0
    
    # Calculating Bowling Performances
    # puts ("---------Calculating Bowling Performances---------")
    @matchdetail.bowlingperformances.each do |bowlperf|
      # puts ("Bowler")
      # puts (bowlperf.bowler_id)
      if bowlperf.bowler_id
        nb_cnt = bowlperf.bowl_seq.scan(/nb/m).size
        wd_cnt = bowlperf.bowl_seq.scan(/wd/m).size
        wk_cnt = bowlperf.bowl_seq.scan(/wk/m).size
        conceded_arr = bowlperf.bowl_seq.gsub(/[bp]/,"").split(",").map{|s| s.to_i}
        bowlperf.conceded = conceded_arr.reduce(:+)
        bowlperf.wickets = wk_cnt
        @matchdetail.extras += nb_cnt + wd_cnt
        bowl_wick += wk_cnt
      else
        bowlperf.destroy
      end
    end

    @matchdetail.wickets = bat_wick #TODO: Check whether both batting and bowling wicket count are same
    @matchdetail.score += @matchdetail.extras
    # puts (@matchdetail.inspect)
    # puts (@matchdetail.battingperformances.inspect)
    # puts (@matchdetail.bowlingperformances.inspect)
  end
  
end