class Site::CategoriesController < SiteController

  def show
    @categories = Category.order_by_description
    @category = Category.friendly.find(params[:id])
    @trips = Trip.by_category(@category)
  end
  
end
