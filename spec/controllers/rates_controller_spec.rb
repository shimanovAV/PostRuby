require 'spec_helper'
require 'rails_helper'

describe RatesController do
  describe 'POST #create' do
    before do
        @post = create(:post)
    end
    context 'with valid attributes' do
      let(:valid_post_request) {
        post :create, :params => {:post_id => @post.id, :rate => attributes_for(:rate), :format => :json}
      }
      it 'saves the rate' do
        expect { valid_post_request }.to change(Rate, :count).by 1
      end
      it 'returns correct json with average rate' do
        valid_post_request
        response.body.should == assigns(:average_rate).to_json
      end
      it "returns status created" do
        valid_post_request
        expect(response).to have_http_status(:created)
      end
    end
    context 'with invalid attributes' do
      let(:invalid_post_request) {
        post :create, :params => {:post_id => @post.id, :rate => attributes_for(:invalid_rate), :format => :json}
      }
      it 'does not save the rate' do
        expect { invalid_post_request }.to_not change(Rate, :count)
      end
      it "returns a unprocessable_entity" do
        invalid_post_request
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end