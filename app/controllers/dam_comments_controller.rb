class DamCommentsController < ApplicationController

  def create
    @dam = Dam.find(params[:dam_id])
    @dam_comment = current_user.dam_comments.new(dam_comment_params)
    @dam_comment.dam_id = @dam.id
    if @dam_comment.save
      flash[:notice] = '口コミを投稿しました．'
      redirect_to dam_path(@dam)
    else
      flash[:alert] = '入力に誤りがあります．'
      session[:error] = @dam_comment.errors.full_messages
      redirect_to dam_path(@dam)
    end
  end

  def destroy
    comment = DamComment.find(params[:dam_id])
    dam = comment.dam
    comment.destroy
    redirect_to dam_path(dam)
  end

  private
    def dam_comment_params
      params.require(:dam_comment).permit(:user_id, :dam_id, :title, :comment, :comment_image)
    end

end
