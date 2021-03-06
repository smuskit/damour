class DamsController < ApplicationController

  before_action :authenticate_admin!, except: [:top, :show]

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
    @prefecture = @dam.prefecture
    if @dam.save
      flash[:notice] = "#{@dam.name}の情報を登録しました．"
      redirect_to dam_path(@dam)
    else
      flash[:alert] = "入力に誤りがあります．"
      render 'new'
    end
  end

  def index
    @dams_prefecture = Dam.order(prefecture_id: "ASC")
    @dams_kana = Dam.order :name_kana

    if params[:search]
      #検索用
      @dams = Dam.page(params[:page]).where('name LIKE ? OR name_kana LIKE ? OR address LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
    else
      #name_kana 並び替え（50音順）
      @dams = Dam.page(params[:page]).order :name_kana
    end
  end

  def show
    @dam = Dam.find(params[:id])
    @dam_comment = DamComment.new
    @dam_comments = @dam.dam_comments.page(params[:page])

    #Ajax通信の場合のみ（もっと見るボタン押下時）ここを通過
    case params[:type]
    when 'dam_comment'
      render "#{params[:type]}"
    end
  end


  def edit
    @dam = Dam.find(params[:id])
  end

  def update
    @dam = Dam.find(params[:id])
    if @dam.update(dam_params)
      flash[:notice] = "#{@dam.name}の情報を更新しました．"
      redirect_to dams_path
    else
      flash[:alert] = "入力に誤りがあります．"
      render 'edit'
    end
  end

  def destroy
    dam = Dam.find(params[:id])
    prefecture = dam.prefecture
      if  dam.destroy
          flash[:notice] = "#{dam.name}の情報を削除しました．"
          redirect_to dams_top_path
      else
        render action: :new
      end
  end

  private
    def prefecture_params
      params.require(:prefecture).permit(:region_id, :name)
    end

    def dam_params
      params.require(:dam).permit(:region_id, :prefecture_id, :name, :name_kana, :postal_code, :address, :river, :dam_type, :gate, :height, :length, :volume, :purpose, :constructor, :start_of_construction, :end_of_construction, :dam_image)
    end

    def dam_comment_params
      params.require(:dam_comment).permit(:user_id, :dam_id, :title, :comment, :comment_image)
    end



end
