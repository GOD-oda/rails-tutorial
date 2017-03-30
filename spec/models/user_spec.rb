require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe "hello method" do
    before do
      user = User.new
      user.name = "テスト　太郎"
      user.age = 30
      user.profile = "私は、エンジニアです"
      user.save
      @user = User.where("age = ?", 30).first
    end
    context "normal case." do
      it "not null" do
        @user.hello.should_not be_nil
      end
      it "name値の比較" do
        result_val = @user.hello
        result_val.should == "テスト　太郎でござる"
        result_val.should eql("テスト　太郎でござる")
      end
    end
  end

  describe "age_up method test" do
    before do
      user = User.new
      user.name = "テスト　太郎"
      user.age = 30
      user.profile = "私は、エンジニアです"
      user.save
      @user = User.where("age = ?", 30).first
    end
    context "normal case." do
      it "30 > age 35" do
        @user.age_up.should be_close(30, 5)
      end
    end
  end
end
