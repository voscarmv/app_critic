class AppsController < ApplicationController
  before_action :set_app, only: %i[show edit update destroy]

  # GET /apps
  # GET /apps.json
  def index
    @apps = App.includes(:opinions).all
  end

  # GET /apps/1
  # GET /apps/1.json
  def show; end

  # GET /apps/new
  def new
    @app = App.new
  end

  # POST /apps
  # POST /apps.json
  def create
    @app = App.new(app_params)

    respond_to do |format|
      if @app.save
        format.html { redirect_to root_path, notice: 'App was successfully created.' }
        format.json { render :show, status: :created, location: @app }
      else
        format.html { render :new }
        format.json { render json: @app.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_app
    @app = App.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def app_params
    params.require(:app).permit(:name, :url, :description)
  end
end
