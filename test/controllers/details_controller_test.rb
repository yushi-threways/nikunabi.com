require 'test_helper'

class DetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @detail = details(:one)
  end

  test "should get index" do
    get details_url
    assert_response :success
  end

  test "should get new" do
    get new_detail_url
    assert_response :success
  end

  test "should create detail" do
    assert_difference('Detail.count') do
      post details_url, params: { detail: { access: @detail.access, holiday: @detail.holiday, open: @detail.open, parking: @detail.parking, payment: @detail.payment, room: @detail.room, shop_id: @detail.shop_id, smoking: @detail.smoking } }
    end

    assert_redirected_to detail_url(Detail.last)
  end

  test "should show detail" do
    get detail_url(@detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_detail_url(@detail)
    assert_response :success
  end

  test "should update detail" do
    patch detail_url(@detail), params: { detail: { access: @detail.access, holiday: @detail.holiday, open: @detail.open, parking: @detail.parking, payment: @detail.payment, room: @detail.room, shop_id: @detail.shop_id, smoking: @detail.smoking } }
    assert_redirected_to detail_url(@detail)
  end

  test "should destroy detail" do
    assert_difference('Detail.count', -1) do
      delete detail_url(@detail)
    end

    assert_redirected_to details_url
  end
end
