class Admin::CommentsController < ApplicationController

  def new
    @deal = Deal.find(params[:deal_id])
    @comment = @deal.comments.build
  end

  def create
    @deal = Deal.find(params[:deal_id])
    @comment = @deal.comments.create params[:comment]
    redirect_to admin_deal_path(@deal)
  end


end
