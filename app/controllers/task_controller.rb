class TaskController < ApplicationController  
  def index
  	@tasks = Task.all
  	respond_to do |format|
  		format.html
      format.json { render json: @tasks}
  	end
  end

  def test

  	respond_to do |format|
  		format.js { render :test }
  	end
  end

  def show
    @task = Task.find(params[:id])
    respond_to do |format|
      format.json { render json: @task}
    end 
  end
end
