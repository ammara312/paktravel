require "rails_helper"

describe User, :type => :model do

  it "user without email is invalid" do
    @user = FactoryBot.build(:user, email: "")
    expect(@user).not_to be_valid
  end

  it "invalid password rejected" do
    @user = FactoryBot.build(:user, password: "hi")
    expect(@user).not_to be_valid
  end
end