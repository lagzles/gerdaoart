class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update]
  before_action :has_access?, except: [:index, :show]


  def index
    @images = Image.all.order(:title)
  end

  def show
  end

  def new
    @image = Image.new
    @categories = Category.all
  end

  def create
    @image = Image.new(image_params)
    if @image.valid?
      @image.save
      redirect_to images_path
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
    params.require(:image).permit(:url, :title, :order, :carousel_id)
  end

  def set_image
    @image = Image.find(params[:id])
  end

end
