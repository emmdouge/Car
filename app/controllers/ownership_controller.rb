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
       if @ownership.save
        render json: @ownership
       end
    end

    # PATCH http://localhost:3000/ownership/id
    def update
        @ownership = Ownership.find(params[:id])
        @ownership.person_id = params[:person_id]
        @ownership.automobile_id = params[:automobile_id]
        @ownership.own = params[:own]
        @ownership.save
        render json: @ownership
    end

    # DELETE http://localhost:3000/ownership/id
    def destroy
        @ownership = Ownership.find(params[:id])
        @ownership.destroy
        render plain: "Destroyed Successfully"
    end

    # GET http://localhost:3000/ownership/owner_history/person_id
    def owner_history
        @ownerships = Ownership.where(person_id: params[:person_id])

        render json: @ownerships
    end

    # GET http://localhost:3000/ownership/car_history/automobile_id
    def car_history
        @ownerships = Ownership.where(automobile_id: params[:automobile_id])

        render json: @ownerships
    end  
    
    # GET http://localhost:3000/ownership/own/person_id
    # Retrieves all the cars someone owns
    def own
        @ownerships = Ownership.where(person_id: params[:person_id], own: true)

        if @ownerships.nil?
            render plain: "This person doesn't own any cars"
        else
            automobile_ids = @ownerships.pluck(:automobile_id)
            @automobiles = Automobile.find(automobile_ids)
            render json: @automobiles
        end 
    end

    # GET http://localhost:3000/ownership/curr_own/automobile_id
    # Retrieves current owner
    def curr_owner
        @ownership = Ownership.where(automobile_id: params[:automobile_id], own: true).first
        if @ownership.nil?
            render plain: "No one currently owns this car"
        else
            @person = Person.find(@ownership.person_id)
            render json: @person
        end       
    end
end
