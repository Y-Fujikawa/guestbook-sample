class Admin::GreetingsController < Admin::AdminController
  before_action :set_greetings, only: [:index]
  before_action :get_greeting, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
		end

		def new
				@greeting = Greeting.new
		end

  def edit
		end

		def create
				@greeting = Greeting.new(greeting_params)
				if @greeting.save
						flash[:success] = "Created profile."
						redirect_to admin_greetings_path
				else
						render :new
				end
		end

  def update
    if @greeting.update_attributes(greeting_params)
      flash[:success] = "Updated profile."
      redirect_to admin_greetings_path
    else
      render :edit
    end
		end

		def destroy
				if @greeting.destroy
						flash[:success] = "Deleted profile."
						redirect_to admin_greetings_path
				else
						render :index
				end
		end

  def enable
    greeting = Greeting.find(params[:greeting_id])
    if greeting.update(is_enable: greeting.is_enable? ? false : true)
        render layout: false, status: :ok
    else
        render layout: false, json: "no data"
    end
  end

  private

  def set_greetings
    @greetings = Greeting.all.order("created_at").page(params[:page]).per(5)
  end

  def get_greeting
    @greeting = Greeting.find(params[:id])
  end

  def greeting_params
    params.require(:greeting).permit(:name, :comment, :is_enable)
  end
end
