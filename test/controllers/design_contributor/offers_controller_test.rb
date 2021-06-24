require 'test_helper'

class DesignContributor::OffersControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get design_contributor_offers_edit_url
    assert_response :success
  end

end
