class ContentsController < ApplicationController
  def index
    @contents = User.find(params[:user_id]).contents.all
  end

  def show
    @content = User.find(params[:user_id]).contents.find(params[:id])
  end

  def new
    @content = current_user.contents.new
  end

  def edit
    @content = current_user.contents.find(params[:id])
  end

  def create
    @content = current_user.contents.new(content_params)
    if @content.save
      redirect_to user_contents_path(user_id: current_user)
    else
      render :new
    end
  end

  def update
    @content = current_user.contents.find(params[:id])
    if @content.update(content_params)
      redirect_to user_contents_path(user_id: current_user)
    else
      render :edit
    end
  end

  private

  def content_params
    params.require(:content).permit(:title, :text)
  end
end
