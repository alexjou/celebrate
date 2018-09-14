class Backoffice::TripsController < BackofficeController
  before_action :set_trip, only: [:edit, :update]

    def index
        @trips = Trip.all
    end

    def edit
      # Se Ad via before_action
    end
    
    def update
      if @trip.update(params_trip)
        redirect_to backoffice_trips_path, notice: "Viagem atualizada com sucesso!"
      else
        render :edit
      end
    end

    def new
      @trip = Trip.new
    end

    def create
      @trip = Trip.new(params_trip)

      if @trip.save
        redirect_to backoffice_trips_path, notice: "Viagem cadastrada com sucesso!"
      else
        render :new
      end
    end
    
    
    
    private

    def set_trip
      @trip = Trip.find(params[:id])
    end

    def params_trip
      params.require(:trip).permit(:id, :title, :category_id, :price, :description, 
                                   :description_md, :description_short, :picture)
    end
    
    
    
end
