require 'test_helper'

class MenuBooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @menu_book = menu_books(:one)
  end

  test "should get index" do
    get menu_books_url
    assert_response :success
  end

  test "should get new" do
    get new_menu_book_url
    assert_response :success
  end

  test "should create menu_book" do
    assert_difference('MenuBook.count') do
      post menu_books_url, params: { menu_book: { images: @menu_book.images } }
    end

    assert_redirected_to menu_book_url(MenuBook.last)
  end

  test "should show menu_book" do
    get menu_book_url(@menu_book)
    assert_response :success
  end

  test "should get edit" do
    get edit_menu_book_url(@menu_book)
    assert_response :success
  end

  test "should update menu_book" do
    patch menu_book_url(@menu_book), params: { menu_book: { images: @menu_book.images } }
    assert_redirected_to menu_book_url(@menu_book)
  end

  test "should destroy menu_book" do
    assert_difference('MenuBook.count', -1) do
      delete menu_book_url(@menu_book)
    end

    assert_redirected_to menu_books_url
  end
end
