require 'test_helper'

class ImageScaffoldsControllerTest < ActionController::TestCase
  setup do
    @image_scaffold = image_scaffolds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:image_scaffolds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create image_scaffold" do
    assert_difference('ImageScaffold.count') do
      post :create, image_scaffold: { description: @image_scaffold.description, image: @image_scaffold.image, title: @image_scaffold.title }
    end

    assert_redirected_to image_scaffold_path(assigns(:image_scaffold))
  end

  test "should show image_scaffold" do
    get :show, id: @image_scaffold
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @image_scaffold
    assert_response :success
  end

  test "should update image_scaffold" do
    patch :update, id: @image_scaffold, image_scaffold: { description: @image_scaffold.description, image: @image_scaffold.image, title: @image_scaffold.title }
    assert_redirected_to image_scaffold_path(assigns(:image_scaffold))
  end

  test "should destroy image_scaffold" do
    assert_difference('ImageScaffold.count', -1) do
      delete :destroy, id: @image_scaffold
    end

    assert_redirected_to image_scaffolds_path
  end
end
