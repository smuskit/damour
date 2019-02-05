class DamsController < ApplicationController

  def top
  end

  def new
    @dam = Dam.new
  end

  def get_prefectures
    render partial: 'select_prefecture_for_dam', locals: {region_id: params[:region_id]}
  end

  def create
    @dam = Dam.new(dam_params)
    if @dam.save
      flash.notice = '登録OK!'
      redirect_to dams_top_path
    else
      flash.notice = '再入力'
      render 'new'
    end
  end

  def show
  end

  def update
  end

  def destroy
    dam = Dam.find(params[:id])
      if  dam.destroy
          flash[:destroy] = '#{dam.name}の情報を削除しました．'
          redirect_to dams_top_path
      else
        render action: :new
      end
  end

  def search
  end

  def management
  end

  private
    def prefecture_params
      params.require(:prefecture).permit(:region_id, :name)
    end

    def dam_params
      params.require(:dam).permit(:region_id, :prefecture_id, :name, :name_kana, :river, :dam_type, :gate, :height, :length, :volume, :purpose, :constructor, :start_of_construction, :end_of_construction, :dam_image_id)
    end

end
