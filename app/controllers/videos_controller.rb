class VideosController < ApplicationController
    before_action :authenticate_user!, except: [:index]
    impressionist actions: [:show], unique: [:session_hash]
  def index
    if current_user
      @videos = current_user.videos

      if params[:search]
          @videos = Video.search(params[:search]).order("created_at DESC").paginate(page: params[:page], per_page: 6)
        else
          @videos = Video.all.order('created_at DESC').paginate(page: params[:page], per_page: 6)
        end
	# Excellent search implementation!!
	# I recommend moving this logic to a model method so you can do things like
	# Video.search(params[:search])
    else
      @videos =Video.all.paginate(page: params[:page], per_page: 6)
    end

  end


    def show
    @video = Video.find(params[:id])
    impressionist(@video)
  end

    def new
    @video = Video.new
    end


    def create

    @video = current_user.videos.build(video_params)
    @video.update(date_created: Time.now.strftime("%B %d, %Y") )
    # you can also call .merge here to add the current user

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
