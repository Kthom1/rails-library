require "application_system_test_case"

class CheckoutRecordsTest < ApplicationSystemTestCase
  setup do
    @checkout_record = checkout_records(:one)
  end

  test "visiting the index" do
    visit checkout_records_url
    assert_selector "h1", text: "Checkout Records"
  end

  test "creating a Checkout record" do
    visit checkout_records_url
    click_on "New Checkout Record"

    click_on "Create Checkout record"

    assert_text "Checkout record was successfully created"
    click_on "Back"
  end

  test "updating a Checkout record" do
    visit checkout_records_url
    click_on "Edit", match: :first

    click_on "Update Checkout record"

    assert_text "Checkout record was successfully updated"
    click_on "Back"
  end

  test "destroying a Checkout record" do
    visit checkout_records_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Checkout record was successfully destroyed"
  end
end
