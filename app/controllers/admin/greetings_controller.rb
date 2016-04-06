class Admin::GreetingsController < Admin::AdminController
  before_action :set_greetings, only: [:index]

  def index
  end

  private

  def set_greetings
    @greetings = Greeting.all.order("created_at").page(params[:page]).per(5)
  end
end
