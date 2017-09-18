class CatsController < ApplicationController
  def index
    @cats = Cat.all
  end


  def show
    @cat = Cat.find(params[:id])
  end


  def new
    @cat = Cat.new
  end


  def edit
    @cat = Cat.find(params[:id])
  end


  def create
    params[:cat][:age] = params[:cat][:age].to_i
    params[:cat][:shots] = (params[:cat][:shots]==="1")
    params[:cat][:image_url] = 'https://cdn3.iconfinder.com/data/icons/avatars-9/145/Avatar_Cat-512.png' if params[:cat][:image_url]===""

    # render plain: params[:cat].inspect
    # copy = Hash.new(params[:cat])
    # @cat = Cat.new(copy)
    # logger.info @cat['cat'].inspect

    @cat = Cat.new(cat_params)
    if @cat.save
      redirect_to @cat
    else
      render 'new'
    end
  end







  def update
    params[:cat][:age] = params[:cat][:age].to_i
    params[:cat][:shots] = (params[:cat][:shots]==="1")
    params[:cat][:image_url] = 'https://cdn3.iconfinder.com/data/icons/avatars-9/145/Avatar_Cat-512.png' if params[:cat][:image_url]===""


    @cat = Cat.find(params[:id])
    if @cat.update(cat_params)
      redirect_to @cat
    else
      render 'edit'
    end

  end

  def destroy
    @cat = Cat.find(params[:id])
    @cat.destroy
    redirect_to cats_path
  end





  private
  def cat_params
    params.require(:cat).permit(:name, :description,:age,:image_url,:shots)
  end
end
