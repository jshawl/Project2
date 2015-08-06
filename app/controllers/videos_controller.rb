class VideosController < ApplicationController
  # before_action :set_video, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index]
    impressionist actions: [:show]
    # , unique: [:session_hash]
  def index
    # @videos = Video.all.order(:likes).reverse
    # @videos = Video.all
    if current_user
      @videos = current_user.videos

      if params[:search]
          @videos = Video.search(params[:search]).order("created_at DESC").paginate(page: params[:page], per_page: 2)
        else
          @videos = Video.all.order('created_at DESC').paginate(page: params[:page], per_page: 2)
        end
    else
      @videos =Video.all.paginate(page: params[:page], per_page: 2)
    end

  end
    # @videos = current_user.videos
    #
    #   if params[:search]
    #     @videos = Video.search(params[:search]).order("created_at DESC")
    #   else
    #     @videos = Video.all.order('created_at DESC')
    #   end
    # end

    def show
    @video = Video.find(params[:id])
  end

    def new
    @video = Video.new
    end


    def create

    # @video = Video.create!(video_params)
    @video = current_user.videos.build(video_params)
    @video.update(date_created: Time.now.strftime("%B %d, %Y") )

    redirect_to (video_path(@video))

  end

  def edit
    @video = Video.find(params[:id])
  end

  def update
    @video = Video.find(params[:id])

    @video.update(video_params)


      redirect_to video_path(@video)
  end

  def destroy
    @video = Video.find(params[:id])
    @video.destroy
    redirect_to videos_path

  end

def upvote
  @video = Video.find(params[:id])
  @video.upvote_by current_user

  redirect_to video_path(@video)

end

private
def video_params
  params.require(:video).permit(:subject, :author, :likes, :link_url)
end


end
