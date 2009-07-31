class FeedsController < ApplicationController
  def show
    @feed = Feed.find_by_name(params[:id]) or raise ActiveRecord::RecordNotFound, "Couldn't find feed with name=#{params[:id]}"
    respond_to do |format|
      format.json { render :json => @feed.to_json }
    end
  end
end
