require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @post = posts(:orange)
  end

end


#test "should redirect create when not logged in" do
#  assert_no_difference 'post.count' do
#    post posts_path, params: { post: { content: "Lorem ipsum" } }
#  end
#  assert_redirected_to login_url #beforeアクションによる
#end

#test "should redirect destroy when not logged in" do
#  assert_no_difference 'post.count' do
#    delete post_path(@post)
#  end
#  assert_redirected_to login_url
#end
