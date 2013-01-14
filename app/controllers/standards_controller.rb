class StandardsController < ApplicationController
  assume(:standard) do
    params[:id] ? StandardDecorator.find(params[:id]) : Standard.new
  end

  def create
    new_standard = Standard.new(params[:standard])
    if new_standard.save
      flash[:message] = "Standard Created"
      redirect_to topic_path(new_standard.parent)
    else
      flash[:warning] = "There was a problem creating the standard."
      redirect_to topic_path(params[:standard][:parent_id])
    end
  end

  def show
  end

  def destroy
    standard.destroy
    flash[:message] = "\"#{ standard.title }\" was deleted."
    redirect_to standard.parent || root_path
  end

  def edit
  end

  def update
    if standard.update_attributes(params[:standard])
      flash[:message] = "Standard Updated"
      redirect_to standard_path(standard)
    else
      flash[:error] = "Standard Could Not Be Saved"
      render :edit
    end    
  end
end
