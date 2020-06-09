require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  #setupという特別なメソッド（各テストが実行される直前で実行されるメソッド）
  def setup
    @base_title = "Ruby on Rails Tutorial Sample App"
  end
  
  test "should get root" do
    get root_url
    assert_response :success
  end
  
  test "should get home" do
    get static_pages_home_url #viewに遷移させるヘルパー
    assert_response :success  # success＝成功
    #assert_selectメソッドでは、特定のHTMLタグが存在するかどうかをテストする（この種のアサーションメソッドはその名から「セレクタ」と呼ばれている）
    assert_select "title", "Home | #{@base_title}"
  end

  test "should get help" do
    get static_pages_help_url 
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
  end

  test "should get about" do
    get static_pages_about_url
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end
  
  test "should get contact" do
    get static_pages_contact_url
    assert_response :success
    assert_select "title", "Contact | #{@base_title}"
  end
  
  
end
