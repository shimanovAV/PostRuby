require 'spec_helper'
require 'rails_helper'

describe RatesController do
  describe 'POST #create' do
    before do
      @post = create(:post)
    end
    context 'with valid attributes' do
      let(:valid_post_request) {
        post :create, :params => attributes_for(:rate).merge(post_id: @post.id), :format => :json
      }
      it 'saves the rate' do
        expect { valid_post_request }.to change(Rate, :count).by 1
      end
      it "returns status created" do
        valid_post_request
        expect(response).to have_http_status(:created)
      end
      it "handles exception correctly" do
        allow_any_instance_of(RatesController).to receive(:create).and_raise(StandardError.new("Unexpected error"))
        valid_post_request
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to eq "Unexpected error"
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
      it "returns right error message" do
        invalid_post_request
        expect(response.body).to eq "Rate hasn't been saved"
      end
    end
  end
end