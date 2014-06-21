require 'spec_helper'

describe Registration do
  it { should belong_to(:pool) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:phone) }
  it { should validate_presence_of(:pool_id) }

  describe "instance methods" do
    describe "#create_user" do
      it "should create an new user with the info of registration" do
        registration = Registration.make!
        new_user = registration.create_user
        registration.reload
        expect(registration.status).to eq("registered")
        expect(new_user.name).to eq(registration.name)
        expect(new_user.last_name).to eq(registration.last_name)
        expect(new_user.nickname).to eq(registration.nickname)
        expect(new_user.email).to eq(registration.email)
      end
    end
  end
end
