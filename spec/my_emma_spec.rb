require File.join(File.dirname(__FILE__), "spec_helper.rb")

describe MyEmma do
  it "defines the host" do
    MyEmma.base_uri.should == "https://app.e2ma.net"
  end

  describe "setting credentials" do
    it "requires signup_post, emma_account_id, username, password" do
      lambda {
        MyEmma.credentials = {}
      }.should raise_error(MyEmma::Error)
    end
  end

  describe "#signup" do
    it "posts to the RemoteSignup endpoint" do
      MyEmma.should_receive(:post).with('/app/view:RemoteSignup', anything)
      MyEmma.signup('test@example.com')
    end

    it "posts the email to the endpoint" do
      MyEmma.should_receive(:post).with(anything, :query => hash_including(:emma_member_email => 'test@example.com'))
      MyEmma.signup('test@example.com')
    end

    it "returns nil if email is invalid" do
      MyEmma.signup('invalid_email_address').should be_nil
      MyEmma.signup(nil).should be_nil
    end

    it "returns an integer on success" do
      MyEmma.stub!(:post => 1)
      MyEmma.signup("me@example.com").success?.should be_true
    end

    it "returns a negative integer on failure" do
      MyEmma.stub!(:post => -1)
      MyEmma.signup("me@example.com").failed?.should be_true
    end

    it "adds credentials to the post request" do
      MyEmma.stub!(:credentials => {:username => 'someuser'})
      MyEmma.should_receive(:post).with(anything, :query => hash_including(:username => 'someuser'))
      MyEmma.signup('email@example.com')
    end

    it "adds additional parameters to the query" do
      MyEmma.stub!(:credentials => {:username => 'someuser'})
      MyEmma.should_receive(:post).with(anything, :query => hash_including(:username => 'someuser', :first_name => "John", :last_name => "Smith", :emma_member_email => 'email@example.com'))
      MyEmma.signup('email@example.com', :first_name => "John", :last_name => "Smith")
    end
  end
end

