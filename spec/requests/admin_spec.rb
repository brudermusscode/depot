require 'rails_helper'

RSpec.describe AdminController, type: :controller do
  describe 'GET /index' do
    before do
      get 'index'
    end

    context 'Signed OUT' do
      it 'should redirect to login page' do
        expect(response).to redirect_to(login_path)
      end
    end

    context 'Signed IN' do
      it 'should stay on admin page' do
      end
    end
  end
end
