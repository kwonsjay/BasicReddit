require 'spec_helper'

describe User do
  it 'does not store user password' do
    user = User.create!(username: "kush", password: "password", email: "kush@aa.io")
    expect(user.password).to eq(nil)
  end

  describe "associations" do
    it {should have_many(:subs)}
    it {should have_many(:links)}
  end
end
