require 'spec_helper'

describe HomeController do

  describe "should return the application homepage" do
    it "returns http success" do
      get :index
      response.should be_success
    end
  end

end
