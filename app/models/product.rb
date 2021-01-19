class Product < ApplicationRecord
	belongs_to :category

	validates :name, :price, :characteristic, :image, presence: true
	validates :name, length: { minimum: 10 }
	validates :characteristic, length: { maximum: 500 }
	validates :price, numericality: { only_integer: true }

	scope :searcher,  -> (params) {
		search_scope = Product.all
		search_scope = search_scope.sub_category(params[:q]) if params[:q].present?
		search_scope = search_scope.products_by_price(params[:price_from], params[:price_to]) if params[:price_from].present? && params[:price_to].present?
		search_scope = search_scope.send(params[:status]) if params[:status].present?
		search_scope = search_scope.by_query(params[:query] || params[:filter]) if params[:query].present? || params[:filter].present?
		search_scope
	}

	scope :sub_category, -> (category) { where('category_id = ?', category) }
	scope :products_by_price, ->(price_from, price_to) { where(price: price_from..price_to) if price_from.present?&&price_to.present?}
	scope :upprice, -> {order( price: :asc )}
	scope :downprice, -> {order( price: :desc )}
	scope :ascendens, -> {order(name: :asc)}
	scope :descendent, -> {order(name: :desc)}
	scope :by_query, -> (parameter) {where('name ILIKE :search', search: "%#{parameter}%") if parameter.present?}

	def to_param
    "#{id}-#{name.parameterize}"
  end
end