require 'spec_helper'

describe Registration do
  it { should belong_to(:pool) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:phone) }
  it { should validate_presence_of(:pool_id) }

  describe "Callbacks" do
    describe "#set_nickname" do
      it "should set a nickname from the name if nickname is not set" do
        registration = Registration.make(name: "Armando Mendoza", nickname: nil)
        registration.save
        expect(registration.nickname).to eq("armando_mendoza")
      end
    end
  end
end