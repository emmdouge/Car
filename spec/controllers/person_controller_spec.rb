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
          response.body.should == valid_params.to_json
        end
      end
  
    #   context "with invalid parameters" do
    #   end
    end
  end