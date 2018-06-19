class PersonController < ApplicationController
    # Remove later
    # Make test for post to http://localhost:3000/person
    skip_before_action :verify_authenticity_token
    
    # returns all people
    def index
        @people = Person.all
        render json: @people
    end

    # returns one person
    def show
       @person = Person.find(params[:id])
       render json: @person
    end

    # returns the page to enter info for new person
    def new
        
    end

    # POST http://localhost:3000/person
    def create
       @person = Person.new
       @person.name = params[:name]
       @person.email = params[:email]
       @person.phone = params[:phone]
       @person.save
       render json: @person
    end

    # PATCH http://localhost:3000/person/id
    def update
        @person = Person.find(params[:id])
        @person.name = params[:name]
        @person.email = params[:email]
        @person.phone = params[:phone]
        @person.save
        render json: @person
    end

    # DELETE http://localhost:3000/person/id
    def destroy
        @person = Person.find(params[:id])
        @person.destroy
    end
end
