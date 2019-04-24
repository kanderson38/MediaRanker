class Work < ApplicationRecord
  validates :title, :creator, :category, presence: true

  def self.top_work
    featured = Work.all.sample

    return featured
  end

  def self.top_ten(category)
    top_works = Work.where(category: category).sample(10)

    return top_works
  end
end
