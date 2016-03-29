require 'test_helper'

class DistrictListsControllerTest < ActionController::TestCase
  setup do
    @district_list = district_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:district_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create district_list" do
    assert_difference('DistrictList.count') do
      post :create, district_list: { name: @district_list.name }
    end

    assert_redirected_to district_list_path(assigns(:district_list))
  end

  test "should show district_list" do
    get :show, id: @district_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @district_list
    assert_response :success
  end

  test "should update district_list" do
    patch :update, id: @district_list, district_list: { name: @district_list.name }
    assert_redirected_to district_list_path(assigns(:district_list))
  end

  test "should destroy district_list" do
    assert_difference('DistrictList.count', -1) do
      delete :destroy, id: @district_list
    end

    assert_redirected_to district_lists_path
  end
end
