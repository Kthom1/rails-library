require 'test_helper'

class ReserveRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reserve_record = reserve_records(:one)
  end

  test "should get index" do
    get reserve_records_url
    assert_response :success
  end

  test "should get new" do
    get new_reserve_record_url
    assert_response :success
  end

  test "should create reserve_record" do
    assert_difference('ReserveRecord.count') do
      post reserve_records_url, params: { reserve_record: {  } }
    end

    assert_redirected_to reserve_record_url(ReserveRecord.last)
  end

  test "should show reserve_record" do
    get reserve_record_url(@reserve_record)
    assert_response :success
  end

  test "should get edit" do
    get edit_reserve_record_url(@reserve_record)
    assert_response :success
  end

  test "should update reserve_record" do
    patch reserve_record_url(@reserve_record), params: { reserve_record: {  } }
    assert_redirected_to reserve_record_url(@reserve_record)
  end

  test "should destroy reserve_record" do
    assert_difference('ReserveRecord.count', -1) do
      delete reserve_record_url(@reserve_record)
    end

    assert_redirected_to reserve_records_url
  end
end
