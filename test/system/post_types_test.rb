require "application_system_test_case"

class PostTypesTest < ApplicationSystemTestCase
  setup do
    @post_type = post_types(:one)
  end

  test "visiting the index" do
    visit post_types_url
    assert_selector "h1", text: "Post Types"
  end

  test "creating a Post type" do
    visit post_types_url
    click_on "New Post Type"

    fill_in "Description", with: @post_type.description
    fill_in "Name", with: @post_type.name
    fill_in "Status", with: @post_type.status
    fill_in "User", with: @post_type.user_id
    click_on "Create Post type"

    assert_text "Post type was successfully created"
    click_on "Back"
  end

  test "updating a Post type" do
    visit post_types_url
    click_on "Edit", match: :first

    fill_in "Description", with: @post_type.description
    fill_in "Name", with: @post_type.name
    fill_in "Status", with: @post_type.status
    fill_in "User", with: @post_type.user_id
    click_on "Update Post type"

    assert_text "Post type was successfully updated"
    click_on "Back"
  end

  test "destroying a Post type" do
    visit post_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Post type was successfully destroyed"
  end
end
