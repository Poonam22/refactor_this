class TodosController < ApplicationController
  before_filter :load_todos

  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def show
    @todo = Todo.find params[:id]
    @count = Todo.where(list_name: @todo.list_name).count
  end

  def create
    params[:todo][:list_name] = params[:todo][:list_name].parameterize
    @todo = Todo.new(params[:todo])
    if @todo.save
      redirect_to root_url, notice: "Todo saved!"
    else
      render :new, alert: "Todo not saved!"
    end
  end

  def edit
    @todo = Todo.find params[:id]
  end

  def update
    @todo = Todo.find params[:id]
    if @todo.update_attributes params[:todo]
      redirect_to @todo
    else
      render :edit, alert: "Todo not saved!"
    end
  end

  private

  def load_todos
    @todos = Todo.all
  end
end
