require "rails_helper"

RSpec.describe EventMailer, type: :mailer do
  describe "event_submission_received" do
    let(:mail) { EventMailer.event_submission_received }

    it "renders the headers" do
      expect(mail.subject).to eq("Event submission received")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "event_request" do
    let(:mail) { EventMailer.event_request }

    it "renders the headers" do
      expect(mail.subject).to eq("Event request")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
