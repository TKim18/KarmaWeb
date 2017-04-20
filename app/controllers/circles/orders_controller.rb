require 'circles_controller.rb'

class Circles::OrdersController < ApplicationController
  before_filter :load_parent
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = @circle.orders.all
    if @orders.empty?
      redirect_to empty_circle_orders_path
    end 
  end

  def empty
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    id = params[:id]
    @order = @circle.orders.find(id)
  end

  # GET /orders/new
  def new
    @order = @circle.orders.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = @circle.orders.new(order_params)
    @order.circleName = @circle.name
    @current_user = User.find_by id: session[:user_id]
    @order.requestUserName = @current_user.name
    respond_to do |format|
      if @order.save
        format.html { redirect_to @circle, notice: 'Order was successfully created.' }
        # format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @circle, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @circle }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to circle_orders_path, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = @circle.orders.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:name, :circleName, :requestUserName, :acceptUserName, :category, :fromLocation, :toDestination, :instant, :preOrderTime, :cost)
    end

    def load_parent
      @circle = Circle.find(params[:circle_id])
    end
end
