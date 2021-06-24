require 'test_helper'

class Company::CompaniesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get company_companies_index_url
    assert_response :success
  end

  test "should get show" do
    get company_companies_show_url
    assert_response :success
  end

  test "should get edit" do
    get company_companies_edit_url
    assert_response :success
  end

end
