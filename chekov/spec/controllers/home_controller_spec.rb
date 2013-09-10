require 'spec_helper'

describe HomeController do
  it "should return the application homepage" do
    get :index
    expect(response.status).to eq(200)
  end
end
