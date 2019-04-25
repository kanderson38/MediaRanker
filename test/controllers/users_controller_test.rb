require "test_helper"

describe UsersController do
  describe "index" do
    it "should display the page" do
      ``
      get users_path
      must_respond_with :ok
    end
  end

  describe "login" do
    it "logs the user in" do
      perform_login

      get current_user_path
      must_respond_with :ok
    end
  end

  describe "logout" do
    it "logs the user out and redirects" do
      perform_login
      post logout_path
      must_respond_with :redirect

      expect(session[:user_id]).must_equal nil
    end
  end

  describe "current" do
    it "loads the page" do
      perform_login

      get current_user_path
      must_respond_with :ok
    end

    it "redirects if no one is logged in" do
      get current_user_path
      must_respond_with :redirect
    end
  end

  describe "login form" do
    it "must load the page" do
      get login_path
      must_respond_with :ok
    end
  end
end
