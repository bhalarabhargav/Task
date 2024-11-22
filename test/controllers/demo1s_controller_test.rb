require "test_helper"

class Demo1sControllerTest < ActionDispatch::IntegrationTest
  setup do
    @demo1 = demo1s(:one)
  end

  test "should get index" do
    get demo1s_url
    assert_response :success
  end

  test "should get new" do
    get new_demo1_url
    assert_response :success
  end

  test "should create demo1" do
    assert_difference("Demo1.count") do
      post demo1s_url, params: { demo1: { description: @demo1.description, name: @demo1.name, status: @demo1.status } }
    end

    assert_redirected_to demo1_url(Demo1.last)
  end

  test "should show demo1" do
    get demo1_url(@demo1)
    assert_response :success
  end

  test "should get edit" do
    get edit_demo1_url(@demo1)
    assert_response :success
  end

  test "should update demo1" do
    patch demo1_url(@demo1), params: { demo1: { description: @demo1.description, name: @demo1.name, status: @demo1.status } }
    assert_redirected_to demo1_url(@demo1)
  end

  test "should destroy demo1" do
    assert_difference("Demo1.count", -1) do
      delete demo1_url(@demo1)
    end

    assert_redirected_to demo1s_url
  end
end
