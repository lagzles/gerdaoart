class CarouselsController < ApplicationController
  before_action :set_carousel, only: [:show, :edit, :update, :destroy]

  def index
    @carousels = Carousel.all
  end

  def show
  end

  def new
    @carousel = Carousel.new
  end

  def edit
  end

  def create
    @carousel = Carousel.new(carousel_params)
    # if @carousel.category_id.nil?
    #   category = Category.find_or_create_by(name: "#{params[:category]}")
    #   @carousel.category_id = category.id
    # end

    if @carousel.valid?
      @carousel.save
      # redirect_to carousels_path, notice: 'Carousel was successfully created.'
      redirect_to image_path @carousel.image, notice: 'Carousel was successfully created.'
    else
       render :new
    end
  end

  def update
    if @carousel.update(carousel_params)
      redirect_to @carousel, notice: 'Carousel was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @carousel.destroy
    respond_to do |format|
      format.html { redirect_to carousels_url, notice: 'Carousel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_carousel
      @carousel = Carousel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def carousel_params
      params.require(:carousel).permit(:name, :image_id, :description, :url)
    end
end
