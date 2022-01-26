require 'rails_helper'

RSpec.describe CartsController, type: :controller do
  fixtures :users
  subject(:user) { User.new }
  let(:user) { users(:Ramastin) }

  describe 'GET /index' do
    before do
      get 'index'
    end

    context 'Signed OUT' do
      it 'should redirect to login' do
        expect(response).to redirect_to(login_path)
      end
    end

    context 'Signed IN' do
      it 'should get /index' do
      end
    end
  end
end
