require 'test_helper'

class Company::DesignContributorsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get company_design_contributors_show_url
    assert_response :success
  end

end
