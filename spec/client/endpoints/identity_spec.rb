require "spec_helper"

describe Paypal::Rest::Client::Endpoints::Identity, vcr: true do
  # Shop.paypal.where("name like '%Hawes%'").last.authentication.token
  let(:client) { Paypal::Rest::Client.new("A23AAM_fbMph8AN3RPl-3wzcRZpArpQv0ze5vohHCyYI5wpOQsn5Tg7RCODkQG7Y1SsBtESGefwpwABGiipaZto5prQQiv1gg") }

  describe "#userinfo" do
    it "returns user details" do
      userinfo = client.userinfo
      expect(userinfo[:name]).to eq("Nathan Hawes")
      expect(userinfo[:businessName]).to eq("Hawes and Pascoe Ltd")
    end
  end
end
