require "application_system_test_case"

class SearchResultsTest < ApplicationSystemTestCase
  setup do
    @search_result = search_results(:one)
  end

  test "visiting the index" do
    visit search_results_url
    assert_selector "h1", text: "Search Results"
  end

  test "creating a Search result" do
    visit search_results_url
    click_on "New Search Result"

    fill_in "Categories", with: @search_result.categories
    fill_in "Email", with: @search_result.email
    fill_in "Keywords", with: @search_result.keywords
    check "Random" if @search_result.random
    click_on "Create Search result"

    assert_text "Search result was successfully created"
    click_on "Back"
  end

  test "updating a Search result" do
    visit search_results_url
    click_on "Edit", match: :first

    fill_in "Categories", with: @search_result.categories
    fill_in "Email", with: @search_result.email
    fill_in "Keywords", with: @search_result.keywords
    check "Random" if @search_result.random
    click_on "Update Search result"

    assert_text "Search result was successfully updated"
    click_on "Back"
  end

  test "destroying a Search result" do
    visit search_results_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Search result was successfully destroyed"
  end
end
