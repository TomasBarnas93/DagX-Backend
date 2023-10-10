require "test_helper"

class ContactFormControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get contact_form_create_url
    assert_response :success
  end
end
