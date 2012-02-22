class StandardsController < ApplicationController
  def create
    new_standard = Standard.new(params[:standard])
    if new_standard.save
      flash[:message] = "Standard Created"
      redirect_to topic_path(new_standard.topic)
    else
      flash[:warning] = "There was a problem creating the standard."
      redirect_to topic_path(params[:standard][:parent_id])
    end
  end
end
