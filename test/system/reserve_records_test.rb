require "application_system_test_case"

class ReserveRecordsTest < ApplicationSystemTestCase
  setup do
    @reserve_record = reserve_records(:one)
  end

  test "visiting the index" do
    visit reserve_records_url
    assert_selector "h1", text: "Reserve Records"
  end

  test "creating a Reserve record" do
    visit reserve_records_url
    click_on "New Reserve Record"

    click_on "Create Reserve record"

    assert_text "Reserve record was successfully created"
    click_on "Back"
  end

  test "updating a Reserve record" do
    visit reserve_records_url
    click_on "Edit", match: :first

    click_on "Update Reserve record"

    assert_text "Reserve record was successfully updated"
    click_on "Back"
  end

  test "destroying a Reserve record" do
    visit reserve_records_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Reserve record was successfully destroyed"
  end
end
