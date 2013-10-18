require 'spec_helper'

describe Sub do
  context 'without user_id or title' do
    let(:incomplete_sub) { sub1 = Sub.new }

    it "validates presence of title" do
      expect(incomplete_sub).to have(1).error_on(:title)
    end

    it "validates presence of user_id" do
      expect(incomplete_sub).to have(1).error_on(:user_id)
    end
  end

  it "validates uniqueness of title" do
    sub1 = Sub.create!({:title => "Cavaliers", :user_id => 1})
    sub2 = Sub.new({:title => "Cavaliers", :user_id => 2})
    expect(sub2).not_to be_valid
  end

  describe "associations" do
    it {should have_many(:link_subs)}
    it {should have_many(:links)}
    it {should belong_to(:user)}
  end
end