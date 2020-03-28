require 'test_helper'

class PostCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post_category = post_categories(:one)
  end

  test "should get index" do
    get post_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_post_category_url
    assert_response :success
  end

  test "should create post_category" do
    assert_difference('PostCategory.count') do
      post post_categories_url, params: { post_category: { description: @post_category.description, name: @post_category.name, parent_category: @post_category.parent_category, status: @post_category.status, user_id: @post_category.user_id } }
    end

    assert_redirected_to post_category_url(PostCategory.last)
  end

  test "should show post_category" do
    get post_category_url(@post_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_post_category_url(@post_category)
    assert_response :success
  end

  test "should update post_category" do
    patch post_category_url(@post_category), params: { post_category: { description: @post_category.description, name: @post_category.name, parent_category: @post_category.parent_category, status: @post_category.status, user_id: @post_category.user_id } }
    assert_redirected_to post_category_url(@post_category)
  end

  test "should destroy post_category" do
    assert_difference('PostCategory.count', -1) do
      delete post_category_url(@post_category)
    end

    assert_redirected_to post_categories_url
  end
end
