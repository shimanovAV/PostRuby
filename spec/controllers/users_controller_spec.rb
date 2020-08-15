require 'spec_helper'
require 'rails_helper'

describe UsersController do
  describe 'GET #search' do

    before do
      @all_users = create_list(:user, 20)
    end

    context 'with optional parameters' do
      context 'with page parameter' do
        before {
          get :index, params: {login: "User", page: 2, format: :json}
        }
        it 'returns correct json' do
          response.body.should == @all_users[10, 10].to_json
        end
        it "returns status ok" do
          expect(response).to have_http_status(:ok)
        end
      end
      context 'with per parameter' do
        before {
          get :index, params: {login: "User", per: 6, format: :json}
        }
        it 'returns correct json' do
          response.body.should == @all_users[0, 6].to_json
        end
        it "returns status ok" do
          expect(response).to have_http_status(:ok)
        end
      end
    end

    context 'with default parameters' do
      before {
        get :index, params: {login: "User 1", format: :json}
      }
      it 'returns correct json' do
        correct_response = @all_users.select { |user| user.login.include?("User 1") }
        response.body.should == correct_response[0, 10].to_json
      end
      it "returns status ok" do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
