class Product < ApplicationRecord
  belongs_to :category
  has_many :cart_items, dependent: :destroy

  validates :name, :price, :characteristic, presence: true
  validates :name, length: { minimum: 10 }
  validates :characteristic, length: { maximum: 500 }
  validates :price, numericality: { only_integer: true }

  scope :searcher,  lambda { |params|
    search_scope = Product.all
    search_scope = search_scope.category(params[:category]) if params[:category].present?
    search_scope = search_scope.sub_category(params[:sub]) if params[:sub].present?
    if params[:price_from].present? && params[:price_to].present?
      search_scope = search_scope.products_by_price(params[:price_from], params[:price_to])
    end
    search_scope = search_scope.send(params[:status]) if params[:status].present?
    if params[:query].present? || params[:filter].present?
      search_scope = search_scope.by_query(params[:query] || params[:filter])
    end
    search_scope
  }
  scope :category, lambda { |category|
    cat = Category.find_by(name: category)
    where(category: cat.subcategory_ids)
  }
  scope :sub_category, ->(category) { where('category_id = ?', category) }
  scope :products_by_price, lambda { |price_from, price_to|
                              where(price: price_from..price_to) if price_from.present? && price_to.present?
                            }
  scope :upprice, -> { order(price: :asc) }
  scope :downprice, -> { order(price: :desc) }
  scope :ascendens, -> { order(name: :asc) }
  scope :descendent, -> { order(name: :desc) }
  scope :by_query, ->(parameter) { where('name ILIKE :search', search: "%#{parameter}%") if parameter.present? }

  has_one_attached :attachment

  def to_param
    "#{id}-#{name.parameterize}"
  end
end

# == Schema Information
#
# Table name: products
#
#  id             :bigint           not null, primary key
#  name           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  category_id    :bigint           not null
#  price          :integer
#  characteristic :string
#
