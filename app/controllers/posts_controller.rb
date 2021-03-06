class PostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: [:create, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params) #loginしてること前提
    if @post.save
      flash[:success] = "Post created!"
      redirect_to user_path
    else
      @feed_items = []
      render '/YABOU.'
    end
  end

  def destroy
    @post.destroy
      flash[:success] = "Post deleted"
      redirect_to request.referrer || root_url
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
