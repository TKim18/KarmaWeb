class CircleController < ApplicationController
  def index
    @circles = Circle.all
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
        format.json { render :show, status: :created, location: @circle }
      else
        format.html { render :new }
        format.json { render json: @circle.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def order_params
      params.require(:circle).permit(:name)
    end

end
