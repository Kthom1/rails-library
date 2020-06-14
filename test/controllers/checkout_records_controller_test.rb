require 'test_helper'

class CheckoutRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @checkout_record = checkout_records(:one)
  end

  test "should get index" do
    get checkout_records_url
    assert_response :success
  end

  test "should get new" do
    get new_checkout_record_url
    assert_response :success
  end

  test "should create checkout_record" do
    assert_difference('CheckoutRecord.count') do
      post checkout_records_url, params: { checkout_record: {  } }
    end

    assert_redirected_to checkout_record_url(CheckoutRecord.last)
  end

  test "should show checkout_record" do
    get checkout_record_url(@checkout_record)
    assert_response :success
  end

  test "should get edit" do
    get edit_checkout_record_url(@checkout_record)
    assert_response :success
  end

  test "should update checkout_record" do
    patch checkout_record_url(@checkout_record), params: { checkout_record: {  } }
    assert_redirected_to checkout_record_url(@checkout_record)
  end

  test "should destroy checkout_record" do
    assert_difference('CheckoutRecord.count', -1) do
      delete checkout_record_url(@checkout_record)
    end

    assert_redirected_to checkout_records_url
  end
end
