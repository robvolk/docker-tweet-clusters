require_relative "spec_helper"

RSpec.describe "my sweet app" do
  it "loads the homepage" do
    get "/"
    expect(last_response).to be_ok
  end
end
