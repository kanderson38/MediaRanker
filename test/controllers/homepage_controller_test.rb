require "test_helper"

describe HomepageController do
  describe "index" do
    it "shows the index page" do
      get works_path
      must_respond_with :ok
    end
  end
end
