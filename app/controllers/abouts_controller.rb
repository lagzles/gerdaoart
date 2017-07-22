class AboutsController < ApplicationController
  before_action :set_about, only: [:show, :edit, :update, :destroy]
  before_action :has_access?, except: [:index, :show]


  def index
    @abouts_pinned = About.where(pinned: true).order(:created_at)
    @abouts_not_pinned = About.where(pinned: false).order(:created_at)
  end

  def show
  end

  def new
    @about = About.new
  end

  def edit
  end

  def create
    @about = About.new(about_params)

    if @about.valid?
      @about.save
      redirect_to abouts_url, notice: 'About was successfully created.'
    else
      render :new
    end
  end

  def update
    if @about.update(about_params)
      redirect_to abouts_url, notice: 'About was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @about.destroy
    redirect_to abouts_url, notice: 'About was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_about
      @about = About.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def about_params
      params.require(:about).permit(:body, :pinned)
    end
end
