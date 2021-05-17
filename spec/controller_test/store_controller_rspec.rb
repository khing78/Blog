require "rails_helper"
RSpec.describe StoresController, type: :request do
    it "assigns all store to @stores" do
        get stores_path
        expect(assigns(:stores)).to eq(Store.all)
    end
end