class GreetingsController < ApplicationController
  before_action :set_greetings, only: [:index, :create]

  def index
    @greeting = Greeting.new
  end

  def create
    @greeting = Greeting.new(greeting_params)

    respond_to do |format|
      if @greeting.save
        format.html { redirect_to greetings_path }
      else
        format.html { render action: 'index' }
      end
    end
  end

  private
  def set_greetings
    @greetings = Greeting.all.order("created_at DESC").page(params[:page]).per(5)
  end

  def greeting_params
    params.require(:greeting).permit(:name, :comment)
  end
end
