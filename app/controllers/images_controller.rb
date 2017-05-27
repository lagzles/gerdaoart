class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update]

  def index
    @images = Image.all.order(:title)
  end

  def show
  end

  def new
    @image = Image.new
  end

  def create
    # # Loop throw images
    # params[:image][:url].each do |url|
    #   case @imageable
    #     when LibraryFile
    @image = Image.new(image_params)
    #     else
    #       @image = @imageable.images.new(image_params)
    #   end
    #   @image.url = url
    #   @image.title = url.original_filename[0..-5]
    if @image.valid?
      @image.save
      redirect_to images_path
    else
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
    params.require(:image).permit(:url, :title, :description, :tags)
  end

  def set_image
    @image = Image.find(params[:id])
  end

end
