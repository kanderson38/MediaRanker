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
    end
  end
end
