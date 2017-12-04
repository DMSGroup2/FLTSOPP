require 'test_helper'

class GivesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gife = gives(:one)
  end

  test "should get index" do
    get gives_url
    assert_response :success
  end

  test "should get new" do
    get new_gife_url
    assert_response :success
  end

  test "should create gife" do
    assert_difference('Gife.count') do
      post gives_url, params: { gife: { officer_id: @gife.officer_id, violation_id: @gife.violation_id } }
    end

    assert_redirected_to gife_url(Gife.last)
  end

  test "should show gife" do
    get gife_url(@gife)
    assert_response :success
  end

  test "should get edit" do
    get edit_gife_url(@gife)
    assert_response :success
  end

  test "should update gife" do
    patch gife_url(@gife), params: { gife: { officer_id: @gife.officer_id, violation_id: @gife.violation_id } }
    assert_redirected_to gife_url(@gife)
  end

  test "should destroy gife" do
    assert_difference('Gife.count', -1) do
      delete gife_url(@gife)
    end

    assert_redirected_to gives_url
  end
end
