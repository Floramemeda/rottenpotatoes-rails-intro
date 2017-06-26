class NovelsController < ApplicationController

  def novel_params
    params.require(:novel).permit(:title, :rating, :description, :release_date, :short_comment, :medium_comment, :long_comment)
  end

  def show
    id = params[:id] # retrieve novel ID from URI route
    @novel = Novel.find(id) # look up novel by unique ID
    # will render app/views/novels/show.<extension> by default
  end

  def index
    @novels = Novel.all
  end

  def new
    # default: render 'new' template
  end

  def create
    @novel = Novel.create!(novel_params)
    flash[:notice] = "#{@novel.title} 创建成功"
    redirect_to novels_path
  end

  def edit
    @novel = Novel.find params[:id]
  end

  def update
    @novel = Novel.find params[:id]
    @novel.update_attributes!(novel_params)
    flash[:notice] = "#{@novel.title} 更新成功"
    redirect_to novel_path(@novel)
  end

  def destroy
    @novel = Novel.find(params[:id])
    @novel.destroy
    flash[:notice] = "'#{@novel.title}' 已删除"
    redirect_to novels_path
  end

end