require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.create(:post)
    FactoryBot.create(:rate, rate: 4, post: @post)
    FactoryBot.create(:rate, rate: 2, post: @post)
  end
  it { should validate_presence_of :title }
  it { should validate_presence_of :body }
  it { should validate_presence_of :author_ip }
  it { should validate_presence_of :user_id }
  it {should have_many :rates}
  it {should belong_to :user}
  it 'should count average rate correctly' do
    @post.average_rate.should == 3.to_d
  end
end
