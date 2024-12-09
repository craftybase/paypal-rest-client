require "spec_helper"

describe Paypal::Rest::Client::Endpoints::Invoices, vcr: true do
  # Shop.paypal.where("name like '%Craftybase%'").last.authentication.token
  let(:client) { Paypal::Rest::Client.new("A23AAPSwyhutwO7pdep4CMcDdNG0Cle40uOkHLqVxrn-_UWmJL1AWjc71yrE9lpeigFdhdABQy3KATqGMQvdTnGBxDUCgsDlA") }

  describe "#invoices" do
    it "returns collection of invoices" do
      invoices = client.invoices[:invoices]
      expect(invoices).to be_an Array
      expect(invoices.size).to eq(17)
    end

    it "returns small collection of items when limit is set" do
      invoices = client.invoices(page: 1, page_size: 1)
      expect(invoices[:invoices]).to be_an Array
      expect(invoices[:invoices].size).to eq(1)
    end

    it "can paginate through the results" do
      page = 0
      invoices = []
      invoice_response = client.invoices(page: page, page_size: 10)
      while !invoice_response[:invoices].empty?
        invoices.concat(invoice_response[:invoices])
        page += 10
        invoice_response = client.invoices(page: page, page_size: 10)
      end
      expect(invoices.size).to eq(17)
    end
  end

  describe "#invoice" do
    # it "raises error" do
    #   expect { client.invoice("aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee") }.
    #     to raise_error Paypal::Rest::Client::InvalidRequestError, "Invalid Invoice ID"
    # end

    it "returns an item" do
      invoice = client.invoice("INV2-BLAL-DPD5-6WVY-YXXS")
      expect(invoice.detail.invoice_number).to eq("0001")
      expect(invoice.detail.invoice_date).to eq("2016-03-11")
    end
  end
end
