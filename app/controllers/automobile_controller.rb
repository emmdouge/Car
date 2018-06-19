class AutomobileController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    # returns all automobiles
    def index
        @automobiles = Person.all
        render json: @automobiles
    end

    # returns one automobile
    def show
       @automobile = Automobile.find(params[:id])
       render json: @automobile
    end

    # returns the page to enter info for new automobile
    def new
        
    end

    # POST http://localhost:3000/automobile
    def create
       @automobile = Automobile.new
       @automobile.model = params[:model]
       @automobile.make = params[:make]
       @automobile.color = params[:color]
       @automobile.milage = params[:milage]
       @automobile.forsale = params[:forsale]
       @automobile.save
    end

    # PATCH http://localhost:3000/automobile/id
    def update
        @automobile = Automobile.find(params[:id])
        @automobile.model = params[:model]
        @automobile.make = params[:make]
        @automobile.color = params[:color]
        @automobile.milage = params[:milage]
        @automobile.forsale = params[:forsale]
        @automobile.save
    end

    # DELETE http://localhost:3000/automobile/id
    def destroy
        @automobile = Automobile.find(params[:id])
        @automobile.destroy
    end

    # GET http://localhost:3000/automobile/sale
    def sale
        @automobiles = Automobile.where(forsale: true)
        render json: @automobiles
    end
end
