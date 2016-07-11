require 'test_helper'

class ZdjenciesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get zdjencies_index_url
    assert_response :success
  end

  test "should get nowa" do
    get zdjencies_nowa_url
    assert_response :success
  end

  test "should get pokaz" do
    get zdjencies_pokaz_url
    assert_response :success
  end

  test "should get edycja" do
    get zdjencies_edycja_url
    assert_response :success
  end

  test "should get usun" do
    get zdjencies_usun_url
    assert_response :success
  end

end
