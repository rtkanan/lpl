class MatchplayersController < ApplicationController
  # GET /matchplayers
  # GET /matchplayers.json
  def index
    @match = Match.find(params[:match_id])
    @matchplayers = @match.matchplayers.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @matchplayers }
    end
  end

  # GET /matchplayers/1
  # GET /matchplayers/1.json
  def show
    if params[:match_id]
      @match = Match.find(params[:match_id])
      # @matchplayers = @match.matchplayers.find(params[:match_id])
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @matchplayer }
    end
  end

  # GET /matchplayers/new
  # GET /matchplayers/new.json
  def new
    @match = Match.find(params[:match_id])
    matchplayers = 8.times { @match.matchplayers.build }

    # respond_to do |format|
      # format.html # new.html.erb
      # format.json { render json: @matchplayers }
    # end
  end

  # GET /matchplayers/1/edit
  def edit
    @matchplayer = Matchplayer.find(params[:id])
  end

  # POST /matchplayers
  # POST /matchplayers.json
  def create
    @match = Match.find(params[:match_id])
    matchplayers = @match.matchplayers.build(params[:matchplayers])

    respond_to do |format|
      if @matchplayers.save
        format.html { redirect_to @matchplayers, notice: 'Matchplayer was successfully created.' }
        format.json { render json: @matchplayers, status: :created, location: @matchplayers }
      else
        format.html { render action: "new" }
        format.json { render json: @matchplayers.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /matchplayers/1
  # PUT /matchplayers/1.json
  def update
    @matchplayer = Matchplayer.find(params[:id])

    respond_to do |format|
      if @matchplayer.update_attributes(params[:matchplayer])
        format.html { redirect_to @matchplayer, notice: 'Matchplayer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @matchplayer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matchplayers/1
  # DELETE /matchplayers/1.json
  def destroy
    @matchplayer = Matchplayer.find(params[:id])
    @matchplayer.destroy

    respond_to do |format|
      format.html { redirect_to matchplayers_url }
      format.json { head :no_content }
    end
  end
end
