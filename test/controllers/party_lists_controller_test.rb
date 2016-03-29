require 'test_helper'

class PartyListsControllerTest < ActionController::TestCase
  setup do
    @party_list = party_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:party_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create party_list" do
    assert_difference('PartyList.count') do
      post :create, party_list: { comments: @party_list.comments, image: @party_list.image, name: @party_list.name }
    end

    assert_redirected_to party_list_path(assigns(:party_list))
  end

  test "should show party_list" do
    get :show, id: @party_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @party_list
    assert_response :success
  end

  test "should update party_list" do
    patch :update, id: @party_list, party_list: { comments: @party_list.comments, image: @party_list.image, name: @party_list.name }
    assert_redirected_to party_list_path(assigns(:party_list))
  end

  test "should destroy party_list" do
    assert_difference('PartyList.count', -1) do
      delete :destroy, id: @party_list
    end

    assert_redirected_to party_lists_path
  end
end
