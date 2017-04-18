class CirclesController < ApplicationController
  def index
    @circles = Circle.all
    Circle.all.each do |circle|
      @search = params[:search]
      if @search
        @circles = Circle.getCircle(@search)
        # @circles = @circles.select 
        # { |circle| circle.name.downcase.include? "#{params[:search]}".downcase}
      end
    end
  end

  def show
    id = params[:id]
    @circle = Circle.find(id)
    redirect_to circle_orders_path(id)   
  end

  def new
    @circle = Circle.new
  end

  def edit
  end

  def create
    @circle = Circle.new(circle_params)

    respond_to do |format|
      if @circle.save
        format.html { redirect_to @circle, notice: 'Circle was successfully created.' }
        # redirect_to circles_path
        # format.json { render :index, status: :created, location: @circle }
      else
        format.html { render :new }
        format.json { render json: @circle.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def circle_params
      params.require(:circle).permit(:name)
    end

end
