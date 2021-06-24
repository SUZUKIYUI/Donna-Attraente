require 'test_helper'

class DesignContributor::DesignContributorsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get design_contributor_design_contributors_show_url
    assert_response :success
  end

  test "should get edit" do
    get design_contributor_design_contributors_edit_url
    assert_response :success
  end

end
