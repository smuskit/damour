class DamCommentsController < ApplicationController

  def create
    dam = Dam.find(params[:dam_id])
    comment = current_user.dam_comments.new(dam_comment_params)
    comment.dam_id = dam.id
    if comment.save
      redirect_to dam_path(dam)
    else
      render 'dams/show'
    end
  end

  def destroy
    dam = Dam.find(params[:dam_id])
    comment = current_user.dam_comments.find_by(dam_id: dam.id)
    comment.destroy
    redirect_to dam_path(dam)
  end

  private
    def dam_comment_params
      params.require(:dam_comment).permit(:user_id, :dam_id, :title, :comment, :comment_image)
    end

end
