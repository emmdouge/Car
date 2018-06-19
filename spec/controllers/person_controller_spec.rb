require 'rails_helper'
require 'rspec/rails'
RSpec.describe "API Person", type: 'request' do
    describe "POST /person" do
      context "with valid parameters" do
        let(:valid_params) do
          {
            id: 1,
            name: "test",
            email: "test@test.com",
            phone: "1111111111"
          }
        end
  
        it "creates a new person" do
          expect { post '/person', params: valid_params }.to change(Person, :count).by(+1)
          expect(response).to have_http_status :ok
          expect(response.body).to eq valid_params.to_json
        end
      end
  
    #   context "with invalid parameters" do
    #   end
    end

    describe "PATCH /person/id" do
        context "with valid parameters" do
          let(:valid_update_params) do
            {
              id: 1,
              name: "updatetest",
              email: "updatetest@test.com",
              phone: "2222222222"
            }
          end

          before(:each) do
            @person = Person.create!(name: "test", email: "test@test.com", phone: "1112223333")
          end

          it "updates an existing person" do
            patch '/person/1', params: valid_update_params
            @person.reload          
            expect(response).to have_http_status :ok
            expect(@person.to_json).to eq valid_update_params.to_json
          end
        end
      end
      
    describe "DELETE /person/id" do
      context "with valid parameters" do
        let(:valid_delete_params) do
          {
            id: 1
          }
        end

        before(:each) do
          @person = Person.create!(name: "test", email: "test@test.com", phone: "1112223333")
        end

        it "delete an existing person" do
          delete '/person/1', params: valid_delete_params
          expect(response).to have_http_status :ok
        end
      end
    end
  end