require 'test_helper'

class DesignContributor::CompaniesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get design_contributor_companies_index_url
    assert_response :success
  end

  test "should get show" do
    get design_contributor_companies_show_url
    assert_response :success
  end

end
