require 'spec_helper'
require 'rails_helper'

describe PostsController do
  describe 'GET #index' do
    before do
      all_posts = create_list(:post, 5)
      create(:rate, rate: 4, post: all_posts.first)
      create(:rate, rate: 2, post: all_posts.first)
      create(:rate, rate: 2, post: all_posts.second)
      all_posts.sort_by! do |post|
        -(post.average_rate)
      end
      @correct_posts = all_posts[0, 3]
      get :index, params: {count: 3, format: :json}
    end

    it 'fill an array of N top posts' do
      expect(assigns(:posts)).to match_array(@correct_posts)
    end
    it 'returns correct json' do
      response.body.should == @correct_posts.to_json
    end
    it "returns status ok" do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #ips' do
    before do
      user1 = create(:user, login: 'User 1')
      user2 = create(:user, login: 'User 2')
      create(:post, title: 'Post 1', body: 'Body 1', author_ip: 'ee123ee456', user: user1)
      create(:post, title: 'Post 2', body: 'Body 2', author_ip: 'ee123ee456', user: user2)
      create(:post, title: 'Post 3', body: 'Body 3', author_ip: 'ii123ii456', user: user1)
      @correct_ips = {ee123ee456: ['User 1', 'User 2'],
                      ii123ii456: ['User 1']}
      get :ips, params: {format: :json}
    end

    it 'fill an array of hashes of IPs that were used by multiple authors' do
      expect(assigns(:ips)).to eq(@correct_ips)
    end
    it 'returns correct json' do
      response.body.should == @correct_ips.to_json
    end
    it "returns a 200" do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      let(:create_post_request) {
        post :create, :params => {:post => attributes_for(:create_post).merge(user_login: 'user 1'), :format => :json}
      }
      context 'user exists and saves the new post in the database' do
        before {create(:user, login: 'user 1')}
        subject { lambda { create_post_request } }
        it { should change { Post.count }.by 1 }
        it { should_not change { User.count } }
      end
      context 'user does not exist and saves the new post in the database' do
        subject { lambda { post :create, :params => {:post => attributes_for(:create_post).merge(user_login: 'user 2'), :format => :json} } }
        it { should change { Post.count }.by 1 }
        it { should change { User.count }.by 1 }
      end
      it 'returns correct json' do
        create_post_request
        response.body.should == assigns(:post).to_json
      end
      it "returns status created" do
        create_post_request
        expect(response).to have_http_status(:created)
      end
    end
    context 'with invalid attributes' do
      let(:create_invalid_post_request) {
        post :create, :params => {post: attributes_for(:invalid_post), :format => :json}
      }
      it 'does not save the post ' do
        expect { create_invalid_post_request }.to_not change(Post, :count)
      end
      it "returns status unprocessable_entity" do
        create_invalid_post_request
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end