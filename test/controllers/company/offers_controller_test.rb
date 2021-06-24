require 'test_helper'

class Company::OffersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get company_offers_new_url
    assert_response :success
  end

end
