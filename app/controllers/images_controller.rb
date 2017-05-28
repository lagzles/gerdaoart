class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update]
  before_action :has_access?, except: [:index, :show]


  def index
    @images = Image.all.order(:title)
    @carousels = Carousel.all.order(created_at: :asc)
  end

  def show
  end

  def new
    @image = Image.new
    @carousel = Carousel.find(params[:carousel_id])
  end

  def create
    @image = Image.new(image_params)

    if @image.category_id.nil?
      category = Category.find_or_create_by(name: "#{params[:category]}")
      @image.category_id = category.id
    end
    if @image.valid?
      @image.save
      # redirect_to carousel_path @image.carousel
      redirect_to image_path @image
    else
      puts "#{@image.errors.full_messages}"
      puts image_params
      render :new, notice: "#{@image.errors.full_messages}"
    end
    # redirect_to root_url
  end

  def edit
  end

  def update
  end

  private

  def image_params
    params.require(:image).permit( :title, :order, :category_id)
  end

  def set_image
    @image = Image.find(params[:id])
  end

end
