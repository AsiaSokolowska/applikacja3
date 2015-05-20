class Article< ActiveRecord::Base
  scope :with_title_333, -> {where(title: '333')}
  scope :by_title, ->(title) {where(title: title)}
  scope :not_older_than, ->(datetime) {where('created_at >= ?', datetime)}



=begin
Article.where('created_at >=?', 1.hour.ago) ---- rails c
  scope :xxx, ->(a) {
    if a == "xxxx"
      where (...)
    else
      where (... ...)
  end
  }
=end

  has_many :article_categories
  has_many :categories, through: :article_categories

  validates :title, :body, :categories, presence: true

end
