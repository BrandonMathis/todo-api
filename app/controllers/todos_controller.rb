class TodosController < ApplicationController
  def index
    render json: Todo.all, each_serializer: TodoSerializer
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update_attributes(todo_params)
      render json: @todo
    else
      render josn: @todo.errors, status: 500
    end
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      render json: @todo
    else
      render josn: @todo.errors, status: 500
    end
  end

  def destroy
    Todo.find(params[:id]).destroy
    render json: {}
  end

  private

  def todo_params
    params[:todo].permit(:title, :is_completed)
  end
end
