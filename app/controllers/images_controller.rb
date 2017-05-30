class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]
  before_action :set_drawing, only: [:new, :create, :edit, :update, :destroy]
  before_action :has_access?, only: [:new, :create, :edit, :update, :destroy]

  def index
    @images = Image.all
  end

  def show
  end

  def new
    @image = Image.new
  end

  def edit
  end

  def create
    @image = Image.new(image_params)
    # if @carousel.category_id.nil?
    #   category = Category.find_or_create_by(name: "#{params[:category]}")
    #   @carousel.category_id = category.id
    # end
    @image.drawing_id = params[:drawing_id]
    puts "#{params[:drawing_id]}"
    puts "#{@image.drawing_id}"
    if @image.valid?
      @image.save
      # redirect_to carousels_path, notice: 'Carousel was successfully created.'
      redirect_to drawing_path @image.drawing, notice: 'Image was successfully created.'
    else
       render :new
    end
  end

  def update
    if @image.update(image_params)
      redirect_to drawing_path @image.drawing, notice: 'Image was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    drawing = @image.drawing
    @image.destroy
    redirect_to drawing_url(drawing), notice: 'Image was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    def set_drawing
      @drawing = Drawing.find(params[:drawing_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:name, :drawing_id, :description, :url, :order)
    end
end
