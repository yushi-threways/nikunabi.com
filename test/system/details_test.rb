require "application_system_test_case"

class DetailsTest < ApplicationSystemTestCase
  setup do
    @detail = details(:one)
  end

  test "visiting the index" do
    visit details_url
    assert_selector "h1", text: "Details"
  end

  test "creating a Detail" do
    visit details_url
    click_on "New Detail"

    fill_in "Access", with: @detail.access
    fill_in "Holiday", with: @detail.holiday
    fill_in "Open", with: @detail.open
    fill_in "Parking", with: @detail.parking
    fill_in "Payment", with: @detail.payment
    fill_in "Room", with: @detail.room
    fill_in "Shop", with: @detail.shop_id
    fill_in "Smoking", with: @detail.smoking
    click_on "Create Detail"

    assert_text "Detail was successfully created"
    click_on "Back"
  end

  test "updating a Detail" do
    visit details_url
    click_on "Edit", match: :first

    fill_in "Access", with: @detail.access
    fill_in "Holiday", with: @detail.holiday
    fill_in "Open", with: @detail.open
    fill_in "Parking", with: @detail.parking
    fill_in "Payment", with: @detail.payment
    fill_in "Room", with: @detail.room
    fill_in "Shop", with: @detail.shop_id
    fill_in "Smoking", with: @detail.smoking
    click_on "Update Detail"

    assert_text "Detail was successfully updated"
    click_on "Back"
  end

  test "destroying a Detail" do
    visit details_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Detail was successfully destroyed"
  end
end
