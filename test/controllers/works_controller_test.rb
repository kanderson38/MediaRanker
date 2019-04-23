require "test_helper"

describe WorksController do
  describe "index" do
    it "shows the index page" do
      get works_path
      must_respond_with :ok
    end
  end

  describe "new" do
    it "must load the page" do
      get new_work_path
      must_respond_with :ok
    end
  end

  describe "create" do
    let(:work_data) {
      {
        work: {
          title: "It",
          category: "book",
          creator: "Stephen King",
        },
      }
    }
    it "must create the work" do
      expect {
        post works_path(params: work_data)
      }.must_change "Work.count", 1

      work = Work.last
      expect(work.title).must_equal "It"
      check_flash
    end
  end

  describe "show" do
    it "must load the page with valid work ID" do
      work_id = Work.first.id
      get work_path(work_id)

      must_respond_with :ok
    end

    it "must redirect with invalid work ID" do
      get work_path(12345678)

      must_redirect_to root_path

      check_flash(:warning)
    end
  end
end
