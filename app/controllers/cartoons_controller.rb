class CartoonsController < ApplicationController
  before_action :set_cartoon, only: %i[show edit update destroy]

  def index
    @cartoons = Cartoon.all
  end

  def show
  end

  def new
    @cartoon = Cartoon.new
  end

  def edit
  end

  def create
    @cartoon = Cartoon.new(cartoon_params)
    if @cartoon.save
      flash[:notice] = "１レコード追加しました"
      redirect_to @cartoon
    else
      flash.now[:alert] = "追加に失敗しました"
      render :new, status: :unprocessable_content
    end
  end

  def update
    if @cartoon.update(cartoon_params)
      flash[:notice] = "１レコード更新しました"
      redirect_to @cartoon
    else
      flash.now[:alert] = "更新に失敗しました"
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    @cartoon.destroy
    flash[:notice] = "１レコード削除しました"
    redirect_to cartoons_path
  end

  private

  def set_cartoon
    @cartoon = Cartoon.find(params[:id])
  end

  def cartoon_params
    params.require(:cartoon).permit(:title, :author, :description)
  end
end
