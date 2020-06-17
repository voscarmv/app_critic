class OpinionsController < ApplicationController
  before_action :set_opinion, only: %i[show edit update destroy]

  # GET /opinions/new
  def new
    @opinion = Opinion.new(authorid: current_user.id)
    @opinions = Opinion.order(created_at: :desc).includes(:author).includes(:app).all
    @apps = App.all
    @whotofollow = current_user.whotofollows
    @whoifollow = current_user.followed_users
  end

  # POST /opinions
  # POST /opinions.json
  def create
    @opinion = Opinion.new(opinion_params)

    respond_to do |format|
      if @opinion.save
        format.html { redirect_to root_path, notice: 'Opinion was successfully created.' }
        format.json { render :show, status: :created, location: @opinion }
      else
        format.html { render :new }
        format.json { render json: @opinion.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_opinion
    @opinion = Opinion.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def opinion_params
    params.require(:opinion).permit(:text, :authorid, :app_id, :sentiment)
  end
end
