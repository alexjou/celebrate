class Site::TripDetailController < SiteController

    def show
      @categories = Category.order_by_description
      @trip = Trip.find(params[:id])
    end
    
end
