class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  # index
  def index
    @comments = Comment.all
    # typically this action shows all comments for a particular video.
    # Why show all comments without a video?
  end

  # new
  def new
    @video = Video.find(params[:video_id])
    @comment = Comment.new
  end

  # create
  def create

    @video = Video.find(params[:video_id])
    @comment = Comment.create!(comment_params.merge(video: @video))
    redirect_to video_comment_path(@video, @comment)

    #
    # @comment = Comment.create(comment_params)
    #
    # redirect_to "/comments/#{@comment.id}"
    # remember to remove commented out code.
  end

  #show
  def show
    @comment = Comment.find(params[:id])
  end

  # edit
  def edit

    @comment = Comment.find(params[:id])
    # to dry up code, you can set this instance variable in a before_action
  end

  # update
  def update

    @comment = Comment.find(params[:id])
  @video = Video.find(params[:video_id])
  @comment.update(song_params.merge(video: @video))
  redirect_to video_comment_path(@comment.video, @comment)



    # @comment = Comment.find(params[:id])
    # @comment.update(comment_params)
    #
    # redirect_to "/comments/#{@comment.id}"
  end

  # destroy
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    # redirect_to "/comments"

    redirect_to songs_path
  end

  private
  def comment_params
    params.require(:comment).permit(:text_body, :author, :date_created, :video_id)
    # I recommend removing video_id from your strong params here.
    # You are overriding this value with `.merge` in your controller actions above.
  end
end
