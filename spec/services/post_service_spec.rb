require 'rails_helper'

RSpec.describe PostService, type: :service do
  before do
    user1 = create(:user, login: 'User 1')
    user2 = create(:user, login: 'User 2')
    create(:post, title: 'Post 1', body: 'Body 1', author_ip: 'ee123ee456', user: user1)
    create(:post, title: 'Post 2', body: 'Body 2', author_ip: 'ee123ee456', user: user2)
    create(:post, title: 'Post 3', body: 'Body 3', author_ip: 'ii123ii456', user: user1)
    @correct_ips = {"ee123ee456" => ['User 1', 'User 2'],
                    "ii123ii456" => ['User 1']}.to_s
    @service = PostService.new
  end

  it "saves and takes data from cache when it does not exist" do
    assert_equal @correct_ips, @service.get_all_ips
  end

  it "takes data from cache when it exists" do
    $redis.set("ips-123", @correct_ips)
    assert_equal @correct_ips, @service.get_all_ips
  end
end