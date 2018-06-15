class PostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @post = current_user.posts.build(post_params) #loginしてること前提
    if @post.save
      flash[:success] = "post created!"
      redirect_to root_url
    else
      @feed_items = current_user.feed.paginate(page: params[:page])
      render '/YABOU.'
    end
  end

  def destroy
  end

  private

   def post_params
     params.require(:post).permit(:content, :picture)
   end

   def correct_user
     @post = current_user.posts.find_by(id: params[:id])
     redirect_to root_url if @post.nil?
   end
end
