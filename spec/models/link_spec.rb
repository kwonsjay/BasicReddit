require 'spec_helper'

describe Link do
  context 'without user_id or title or body or url' do
    let(:incomplete_link) { link1 = Link.new }

    it "validates presence of title" do
      expect(incomplete_link).to have(1).error_on(:title)
    end

    it "validates presence of user_id" do
      expect(incomplete_link).to have(1).error_on(:user_id)
    end

    it "validates presence of body" do
      expect(incomplete_link).to have(1).error_on(:body)
    end

    it "validates presence of url" do
      expect(incomplete_link).to have(1).error_on(:url)
    end
  end

  it "validates uniqueness of url" do
    link1 = Link.create!({:url => "http://www.google.com ", :body => "fap", :title => "Cavaliers", :user_id => 1})
    link2 = Link.new({:url => "http://www.google.com ", :body => "fap", :title => "Cavaliers", :user_id => 1})
    expect(link2).not_to be_valid
  end

  describe "associations" do
    it {should have_many(:link_subs)}
    it {should have_many(:subs)}
    it {should belong_to(:user)}
  end
end