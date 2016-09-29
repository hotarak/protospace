class PrototypesController < ApplicationController
  before_action :move_to_index, except: [:index]
  before_action :set_prototype, only: [:show, :edit]
  before_action :set_user, only: [:show]

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path, notice: 'Pust prototype successfully'
    else
      redirect_to new_prototype_path, alert: 'something is empty'
    end
  end

  def show
  end

  def destroy
  end

  def edit
  end

  def update
  end

private
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def prototype_params
    params.require(:prototype).permit(:user_id, :title, :catch_copy, :concept, images_attributes: [:id, :file, :status]
    )
  end

end
