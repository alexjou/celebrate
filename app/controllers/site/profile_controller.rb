class Site::ProfileController < SiteController
    layout "profile"
    def index
      @categories = Category.order_by_description
      @trips = Trip.last_six
    end
  end
  