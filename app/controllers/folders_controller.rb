class FoldersController < ApplicationController
  def new
      @folder = Folder.new
  end

  def create
      @folder = Folder.new(folder_params)
    
      if @folder.save
        redirect_to @folder, notice: 'File was successfully uploaded.'
      else
        render :new
      end
  end
  
  def show
    @folder = Folder.find(params[:id])
  end
  private
    
  def folder_params
    params.require(:folder).permit(:title, :file)
  end

end