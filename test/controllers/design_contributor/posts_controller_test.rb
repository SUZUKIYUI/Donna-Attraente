require 'test_helper'

class DesignContributor::PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get design_contributor_posts_index_url
    assert_response :success
  end

  test "should get new" do
    get design_contributor_posts_new_url
    assert_response :success
  end

  test "should get show" do
    get design_contributor_posts_show_url
    assert_response :success
  end

  test "should get edit" do
    get design_contributor_posts_edit_url
    assert_response :success
  end

end
