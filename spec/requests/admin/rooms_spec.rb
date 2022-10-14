require 'rails_helper'
require 'devise'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/admin/rooms", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # Admin::Room. As you add validations to Admin::Room, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {room_name: "room", short_description: "desc", long_description: "ldesc", price: 12}
  }

  let(:invalid_attributes) {
    {room_name: "room", short_description: "desc", long_description: 12}
  }

  let(:admin) do
    User.create! email: 'example@mail.ru', password: 'example'
  end

  before do
    login_as(admin)
  end

  describe "GET /index" do
    it "renders a successful response" do
      Room.create! valid_attributes
      get admin_rooms_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      room = Room.create! valid_attributes
      get admin_room_url(room)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_admin_room_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      room = Room.create! valid_attributes
      get edit_admin_room_url(room)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Room" do
        expect {
          post admin_rooms_url, params: { room: valid_attributes }
        }.to change(Room, :count).by(1)
      end

      it "redirects to the admin_rooms" do
        post admin_rooms_url, params: { room: valid_attributes }
        expect(response).to redirect_to(admin_rooms_url)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Room" do
        expect {
          post admin_rooms_url, params: { room: invalid_attributes }
        }.to change(Room, :count).by(0)
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { room_name: "room_change", short_description: "desc", long_description: "ldesc", price: 12 }
      }

      it "updates the requested admin_room" do
        room = Room.create! valid_attributes
        patch admin_room_url(room), params: { room: new_attributes }
        room.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the admin rooms" do
        room = Room.create! valid_attributes
        patch admin_room_url(room), params: { room: new_attributes }
        room.reload
        expect(response).to redirect_to(admin_rooms_url)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested admin_room" do
      room = Room.create! valid_attributes
      expect {
        delete admin_room_url(room)
      }.to change(Room, :count).by(-1)
    end

    it "redirects to the admin_rooms list" do
      room = Room.create! valid_attributes
      delete admin_room_url(room)
      expect(response).to redirect_to(admin_rooms_url)
    end
  end
end
