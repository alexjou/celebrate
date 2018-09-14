class Site::HomeController < SiteController
  def index
    @categories = Category.order_by_description
    @trips = Trip.descending_order(params[:page])
    @carousel = Trip.limit(3).order("RANDOM()")
  end
end
