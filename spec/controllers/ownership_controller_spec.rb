require 'rails_helper'
require 'rspec/rails'
RSpec.describe "API Ownership", type: 'request' do
  
    before(:each) do
        @ownerships = Ownership.create!([              
            { id: 1, person_id: 1, automobile_id: 1, own: true },
            { id: 2, person_id: 2, automobile_id: 5, own: true },
            { id: 3, person_id: 1, automobile_id: 2, own: false },
            { id: 4, person_id: 1, automobile_id: 3, own: false },
            { id: 5, person_id: 2, automobile_id: 1, own: false },
            { id: 6, person_id: 2, automobile_id: 6, own: true }
        ])
        @people = Person.create!([              
            { id: 1, name: 'Sam', email: 'sam@gmail.com', phone: '2221114444' },
        ])
        @automobiles = Automobile.create!([              
            { id: 5, model: 'Fiat', make: '500', color: 'white', mileage: 5, forsale: true },
            { id: 6, model: 'Chrylser', make: 'Charger', color: 'red', mileage: 5, forsale: true },
        ])
    end

    describe "GET /ownership/car_history/id" do
      context "with valid parameters" do
        let(:valid_params) do
          {
            automobile_id: 1
          }
        end

        it "gets car history" do
          get '/ownership/car_history/1', params: valid_params
          expect(response).to have_http_status :ok
          expect(response.body).to eq @ownerships.values_at(0,4).to_json
        end
      end  
    end 

    describe "GET /ownership/owner_history/id" do
      context "with valid parameters" do
        let(:valid_params) do
          {
            person_id: 1
          }
        end

        it "gets owner history" do
          get '/ownership/owner_history/1', params: valid_params
          expect(response).to have_http_status :ok
          expect(response.body).to eq @ownerships.values_at(0,2,3).to_json
        end
      end
    end
    
    describe "GET /ownership/own/id" do
        context "with valid parameters" do
          let(:valid_params) do
            {
              person_id: 2
            }
          end
  
          it "gets owner's owned cars" do
            get '/ownership/own/2', params: valid_params
            expect(response).to have_http_status :ok
            expect(response.body).to eq @automobiles.values_at(0,1).to_json
          end
        end
      end

    describe "GET /ownership/curr_own/id" do
        context "with valid parameters" do
          let(:valid_params) do
            {
              automobile_id: 5
            }
          end
  
          it "gets current owner" do
            get '/ownership/curr_owner/1', params: valid_params
            expect(response).to have_http_status :ok
            expect(response.body).to eq @people[0].to_json
          end
        end
      end
  
    #   context "with invalid parameters" do
    #   end
  end