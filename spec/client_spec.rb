require 'spec_helper'

describe Paypal::Rest::Client, vcr: true do
  # PayPal returns a 200 OK HTML page for invalid endpoints
  # describe "invalid endpoint" do
  #   let(:client) { Paypal::Rest::Client.new("A015ZU8pFgZgOKtSDTldMrtb.v68Fif.JhgQhGBqhKGgix8") }
  #   it "raises error" do
  #     expect { client.get("foobar") }.
  #       to raise_error Paypal::Rest::Client::NotFoundError, "NotFound"
  #   end
  # end

  # describe "revoked token" do
  #   let(:client) { Paypal::Rest::Client.new("AABBCCDDEEFFGGHHIIJJKKLLMMNNOOPPQQRRSSTTUUVVWWXXYYZZ") }
  #   it "raises error" do
  #     expect { client.get("invoices") }.
  #       to raise_error Paypal::Rest::Client::AuthError
  #   end
  # end
  #
  # describe "missing api key" do
  #   let(:client) { Paypal::Rest::Client.new }
  #   it "raises error" do
  #     expect { client.get("invoices") }.
  #       to raise_error Paypal::Rest::Client::AuthError
  #   end
  # end
end
