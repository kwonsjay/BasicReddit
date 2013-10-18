require 'spec_helper'

describe UserVote do
  context 'without user_id or link_id or vote_val' do
    let(:incomplete_uservote) { uservote1 = UserVote.new }

    it "validates presence of link_id" do
      expect(incomplete_uservote).to have(1).error_on(:link_id)
    end

    it "validates presence of user_id" do
      expect(incomplete_uservote).to have(1).error_on(:user_id)
    end

    it "validates presence of vote_val" do
      expect(incomplete_uservote.vote_val).to eq(0)
    end

  end

  describe "associations" do
    it {should belong_to(:user)}
    it {should belong_to(:link)}
  end
end