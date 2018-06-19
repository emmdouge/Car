class OwnershipController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    # returns all ownerships
    def index
        @ownerships = Ownership.all
        render json: @ownerships
    end

    # returns one ownership
    def show
       @ownership = Ownership.find(params[:id])
       render json: @ownership
    end

    # returns the page to enter info for new ownership
    def new
        
    end

    # POST http://localhost:3000/ownership
    def create
       @ownership = Ownership.new
       @ownership.person_id = params[:person_id]
       @ownership.automobile_id = params[:automobile_id]
       @ownership.own = params[:own]
       @ownership.save
    end

    # PATCH http://localhost:3000/ownership/id
    def update
        @ownership = Ownership.find(params[:id])
        @ownership.person_id = params[:person_id]
        @ownership.automobile_id = params[:automobile_id]
        @ownership.own = params[:own]
        @ownership.save
    end

    # DELETE http://localhost:3000/ownership/id
    def destroy
        @ownership = Ownership.find(params[:id])
        @ownership.destroy
    end

    # GET http://localhost:3000/ownership/owner_history/id
    def owner_history
        @ownerships = Ownership.where(person_id: params[:person_id])

        puts @ownerships.inspect

        render json: @ownerships
    end

    # GET http://localhost:3000/ownership/car_history/id
    def car_history
        @ownerships = Ownership.where(automobile_id: params[:automobile_id])
        
        puts @ownerships.inspect

        render json: @ownerships
    end    
end
