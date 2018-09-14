class Site::SearchController < SiteController

  def trips
    @trips = Trip.search(params[:q], params[:page])
    @categories = Category.all
  end
  

end
