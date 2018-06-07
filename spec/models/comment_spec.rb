require "rails_helper"
 
describe Comment do
  context "when the comment has no rating" do
  	it "is not valid a comment without rating" do 
  	   expect(Comment.new(body: "awesome food")).not_to be_valid
    end

    it "is not valid without a user id" do
      expect(Comment.new(user_id:nil)).not_to be_valid
    end   
  end

  context "when the comment has no product" do
    it "is not accepted" do
      user = FactoryBot.build(:user)
      comment = Comment.new(user: user, body: "not nice!", rating: 1)
      expect(comment).not_to be_valid
    end
  end  
end