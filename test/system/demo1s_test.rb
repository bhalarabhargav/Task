require "application_system_test_case"

class Demo1sTest < ApplicationSystemTestCase
  setup do
    @demo1 = demo1s(:one)
  end

  test "visiting the index" do
    visit demo1s_url
    assert_selector "h1", text: "Demo1s"
  end

  test "should create demo1" do
    visit demo1s_url
    click_on "New demo1"

    fill_in "Description", with: @demo1.description
    fill_in "Name", with: @demo1.name
    fill_in "Status", with: @demo1.status
    click_on "Create Demo1"

    assert_text "Demo1 was successfully created"
    click_on "Back"
  end

  test "should update Demo1" do
    visit demo1_url(@demo1)
    click_on "Edit this demo1", match: :first

    fill_in "Description", with: @demo1.description
    fill_in "Name", with: @demo1.name
    fill_in "Status", with: @demo1.status
    click_on "Update Demo1"

    assert_text "Demo1 was successfully updated"
    click_on "Back"
  end

  test "should destroy Demo1" do
    visit demo1_url(@demo1)
    click_on "Destroy this demo1", match: :first

    assert_text "Demo1 was successfully destroyed"
  end
end
