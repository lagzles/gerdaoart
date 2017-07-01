class DrawingsController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]
  before_action :has_access?, except: [:index, :show]


  def index

    if params[:counting] == nil
      counting = 0
    else
      # counting = DateTime.parse(params[:counting])
      # draw = Drawing.find(params[:counting])
      counting = params[:counting]#draw.created_at
    end
    puts counting
    puts counting
    puts counting

    if params[:category_id] == nil
      @drawings_all = Drawing.all
      @drawing_count = @drawings_all.count
      if counting == 0
        @drawings = Drawing.limit(6).order(created_at: :asc)
        puts "counting zero"
      else
        puts "counting nao eh zero"
        puts counting
        puts "counting nao eh zero"

        @drawings = Drawing.where("id > #{(counting)}").order(created_at: :asc).limit(6)
      end
    else
      @drawings_all = Drawing.where(category_id: params[:category_id])
      @drawing_count = @drawings_all.count
      @drawings = Drawing.where(category_id: params[:category_id]).where('id > ?', counting).order(created_at: :asc).limit(6)
    end
    @first_count = @drawings.first.id
    @last_count = @drawings.last.id
    @categories = Category.all
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
