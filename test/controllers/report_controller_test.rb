require 'test_helper'

class ReportControllerTest < ActionDispatch::IntegrationTest
  test "should get products" do
    get report_products_url
    assert_response :success
  end

end
