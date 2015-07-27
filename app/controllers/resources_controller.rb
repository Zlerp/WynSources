class ResourcesController < ApplicationController

  before_filter :authorize

  def index
    @resources = Resource.all
  end

  def new
    @resource = Resource.new
  end

  def create
    @resource = Resource.create(resource_params)
    redirect_to resources_path
  end

  def edit
    @resource = Resource.find(params[:id])
  end

  def show
    @resource = Resource.find(params[:id])
    @comment = Comment.new      # Added by Ed
  end

  def update
    @resource = Resource.find(params[:id])
    @resource.update(resource_params)
    redirect_to (resource_path(@resource))
  end

  def destroy
    @resource = Resource.find(params[:id])
    @resource.destroy
    redirect_to resources_path
  end

  private

  def resource_params
    params.require(:resource).permit(:title, :url, :description)
  end

end
