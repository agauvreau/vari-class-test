class InstrumentsController < ApplicationController
    before_action :find_instrument, only: [:show, :edit, :update, :destroy]
    
    
    def index
        @instruments = Instrument.all
    end
    
    def show
    end
    
    def new
        @instrument = Instrument.new
    end
    
    def create
        @instrument = Instrument.new(instrument_params)
        if @instrument.save
            flash[:success] = "Instrument was successfully created"
            redirect_to 'instruments#index'
        else
            render @instruments
        end
    end
    
    def update
        if @instrument.update(instrument_params)
            flash[:success] = "Instrument was successfully updated"
            redirect_to root_path
        else
            render 'edit'
        end
        
    end
    
    def destroy
        if @instrument.destroy
            flash[:success] = "Instrument was successfully deleted"
            redirect_to root_path
        else
            flash[:danger] = "Instrument could not be deleted"
            redirect_to edit_instrument_path
        end
    end
    
    private
    def instrument_params
        params.require(:instrument).permit(:name, :ident, :model, :maker, :inst_type)
    end
    
    def find_instrument
        @instrument = Instrument.find(params[:id])
    end
    
end
