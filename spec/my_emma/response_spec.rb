require File.join(File.dirname(__FILE__), "/../spec_helper.rb")

describe MyEmma::Response do
  describe "#initialize" do
    it "instantiates with a response code" do
      expect{ MyEmma::Response.new('1') }.should_not raise_error
    end

    it "transforms the response code to an integer" do
      response = MyEmma::Response.new('1')
      response.code.should == 1
    end
  end

  describe "successful response" do
    it "succeeded" do
      response = MyEmma::Response.new('1')
      response.success?.should be_true
    end

    it "added a member" do
      response = MyEmma::Response.new('1')
      response.added_member?.should be_true
    end

    it "updated a member" do
      response = MyEmma::Response.new('2')
      response.updated_member?.should be_true
    end

    it "indicates member already exists" do
      response = MyEmma::Response.new('3')
      response.member_exists?.should be_true
    end
  end

  describe "failure" do
    it "failed" do
      response = MyEmma::Response.new('-1')
      response.failed?.should be_true
    end

    it "authentication" do
      response = MyEmma::Response.new('-1')
      response.authentication_failed?.should be_true
    end

    it "member add failed" do
      response = MyEmma::Response.new('-2')
      response.add_member_failed?.should be_true
    end

    it "member update failed" do
      response = MyEmma::Response.new('-3')
      response.update_member_failed?.should be_true
    end

    it "non-integer response is a failure" do
      response = MyEmma::Response.new('<html>blah</html>')
      response.failed?.should be_true
    end
  end
end
