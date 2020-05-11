require 'spec_helper'
require 'rails_helper'

describe RatesController do
  describe 'POST #create' do
    before do
      @post = FactoryBot.create(:post)
    end
    context 'with valid attributes' do
      it 'saves the rate' do
        expect { post :create, :params => {:post_id => @post.id, :rate => FactoryBot.attributes_for(:rate), :format => :json} }.to change(Rate, :count).by 1
      end
      it 'returns correct json with average rate' do
        post :create, :params => {:post_id => @post.id, :rate => FactoryBot.attributes_for(:rate), :format => :json}
        response.body.should == assigns(:average_rate).to_json
      end
      it "returns a 200" do
        post :create, :params => {:post_id => @post.id, :rate => FactoryBot.attributes_for(:rate), :format => :json}
        expect(response).to have_http_status(200)
      end
    end
    context 'with invalid attributes' do
      it 'does not save the rate' do
        expect { post :create, :params => {:post_id => @post.id, :rate => FactoryBot.attributes_for(:invalid_rate), :format => :json} }.to_not change(Rate, :count)
      end
      it "returns a 422" do
        post :create, :params => {:post_id => @post.id, :rate => FactoryBot.attributes_for(:invalid_rate), :format => :json}
        expect(response).to have_http_status(422)
      end
    end
  end
end