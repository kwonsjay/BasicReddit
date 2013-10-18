require 'spec_helper'

describe LinkSub do
  context 'without sub_id or link_id' do
    let(:incomplete_linksub) { linksub1 = LinkSub.new }

    it "validates presence of link_id" do
      expect(incomplete_linksub).to have(1).error_on(:link_id)
    end

    it "validates presence of sub_id" do
      expect(incomplete_linksub).to have(1).error_on(:sub_id)
    end
  end

  describe "associations" do
    it {should belong_to(:sub)}
    it {should belong_to(:link)}
  end
end