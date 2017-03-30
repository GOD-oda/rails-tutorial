require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get '/articles'
    assert_response :success
    assert_not_nil assigns(:articles)
  end

  test "index should render correct template and layout" do
    get '/articles'
    assert_template :index
    assert_template layout: "layouts/application"
  end

  test "new should render correct layout" do
    get '/articles/new'
    assert_template :new
    assert_template layout: "layouts/application", partial: "_form"
  end
end
