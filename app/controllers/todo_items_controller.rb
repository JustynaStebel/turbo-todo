class TodoItemsController < ApplicationController
  before_action :set_todo_item, only: [:edit, :update, :destroy, :complete]

  def index
    @todo_items = TodoItem.all.sort_by { |item| item.completed ? 1 : 0 }
  end

  def new
    @todo_item = TodoItem.new
  end

  def edit
  end

  def create
    @todo_item = TodoItem.new(todo_item_params)

    respond_to do |format|
      if @todo_item.save
        format.html { redirect_to todo_items_url, notice: 'Todo item was successfully created.' }
        format.json { head :no_content }
      else
        format.html { render :new }
        format.json { render json: @todo_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @todo_item.update(todo_item_params)
        format.html { redirect_to todo_items_url, notice: 'Todo item was successfully updated.' }
        format.json { head :no_content }     
      else
        format.html { render :edit }
        format.json { render json: @todo_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @todo_item.destroy
    respond_to do |format|
      format.html { redirect_to todo_items_url, notice: 'Todo item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def complete
    @todo_item.update_attribute(:completed, true)
    respond_to do |format|
      format.html { redirect_to todo_items_url, notice: 'Todo item was completed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_todo_item
      @todo_item = TodoItem.find(params[:id])
    end

    def todo_item_params
      params.require(:todo_item).permit(:content, :completed)
    end
end
