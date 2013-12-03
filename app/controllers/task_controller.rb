class TaskController < ApplicationController  
  def index
  	@tasks = Task.all
  	respond_to do |format|
  		format.html
  	end
  end

  def test

  	respond_to do |format|
  		format.js { render :test }
  	end
  end

end
