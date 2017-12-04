require 'test_helper'

class LocatedAtsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @located_at = located_ats(:one)
  end

  test "should get index" do
    get located_ats_url
    assert_response :success
  end

  test "should get new" do
    get new_located_at_url
    assert_response :success
  end

  test "should create located_at" do
    assert_difference('LocatedAt.count') do
      post located_ats_url, params: { located_at: { county_fips: @located_at.county_fips, driver_age: @located_at.driver_age, driver_gender: @located_at.driver_gender, driver_race: @located_at.driver_race, officer_id: @located_at.officer_id, stop_date: @located_at.stop_date, stop_time: @located_at.stop_time, violation_id: @located_at.violation_id } }
    end

    assert_redirected_to located_at_url(LocatedAt.last)
  end

  test "should show located_at" do
    get located_at_url(@located_at)
    assert_response :success
  end

  test "should get edit" do
    get edit_located_at_url(@located_at)
    assert_response :success
  end

  test "should update located_at" do
    patch located_at_url(@located_at), params: { located_at: { county_fips: @located_at.county_fips, driver_age: @located_at.driver_age, driver_gender: @located_at.driver_gender, driver_race: @located_at.driver_race, officer_id: @located_at.officer_id, stop_date: @located_at.stop_date, stop_time: @located_at.stop_time, violation_id: @located_at.violation_id } }
    assert_redirected_to located_at_url(@located_at)
  end

  test "should destroy located_at" do
    assert_difference('LocatedAt.count', -1) do
      delete located_at_url(@located_at)
    end

    assert_redirected_to located_ats_url
  end
end
