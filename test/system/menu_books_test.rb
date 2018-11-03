require "application_system_test_case"

class MenuBooksTest < ApplicationSystemTestCase
  setup do
    @menu_book = menu_books(:one)
  end

  test "visiting the index" do
    visit menu_books_url
    assert_selector "h1", text: "Menu Books"
  end

  test "creating a Menu book" do
    visit menu_books_url
    click_on "New Menu Book"

    fill_in "Images", with: @menu_book.images
    click_on "Create Menu book"

    assert_text "Menu book was successfully created"
    click_on "Back"
  end

  test "updating a Menu book" do
    visit menu_books_url
    click_on "Edit", match: :first

    fill_in "Images", with: @menu_book.images
    click_on "Update Menu book"

    assert_text "Menu book was successfully updated"
    click_on "Back"
  end

  test "destroying a Menu book" do
    visit menu_books_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Menu book was successfully destroyed"
  end
end
