class DrawingsController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]
  before_action :has_access?, except: [:index, :show]


  def index
    @drawings = Drawing.all.order(:title)
    @images = Image.all.order(drawing_id: :asc).order(order: :asc)
  end

  def show
  end

  def new
    @drawing = Drawing.new
    # @carousel = Carousel.find(params[:carousel_id])
  end

  def create
    @drawing = Drawing.new(image_params)

    if @drawing.category_id.nil?
      category = Category.find_or_create_by(name: "#{params[:category]}")
      @drawing.category_id = category.id
    end
    if @drawing.valid?
      @drawing.save
      # redirect_to carousel_path @image.carousel
      redirect_to drawing_path @drawing
    else
      puts "#{@drawing.errors.full_messages}"
      puts image_params
      render :new, notice: "#{@drawing.errors.full_messages}"
    end
    # redirect_to root_url
  end

  def edit
  end

  def update
  end

  def destroy

      @drawing.destroy
      redirect_to drawings_url, notice: 'Carousel was successfully destroyed.'
  end

  private

  def image_params
    params.require(:drawing).permit( :title, :order, :category_id)
  end

  def set_image
    @drawing = Drawing.find(params[:id])
  end

end
