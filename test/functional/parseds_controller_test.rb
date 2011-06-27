require 'test_helper'

class ParsedsControllerTest < ActionController::TestCase
  setup do
    @parsed = parseds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:parseds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create parsed" do
    assert_difference('Parsed.count') do
      post :create, :parsed => @parsed.attributes
    end

    assert_redirected_to parsed_path(assigns(:parsed))
  end

  test "should show parsed" do
    get :show, :id => @parsed.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @parsed.to_param
    assert_response :success
  end

  test "should update parsed" do
    put :update, :id => @parsed.to_param, :parsed => @parsed.attributes
    assert_redirected_to parsed_path(assigns(:parsed))
  end

  test "should destroy parsed" do
    assert_difference('Parsed.count', -1) do
      delete :destroy, :id => @parsed.to_param
    end

    assert_redirected_to parseds_path
  end
end
