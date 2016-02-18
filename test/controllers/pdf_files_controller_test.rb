require 'test_helper'

class PdfFilesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get creat" do
    get :creat
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

end
