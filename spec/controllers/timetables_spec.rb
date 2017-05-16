require 'rails_helper'
require 'spec_helper'

describe TimetablesController do

  describe 'non authorized user' do
    it 'index page redirect to login page' do
      get :index
      expect(response).to redirect_to access_login_url
    end

    it 'new page redirect to login page' do
      get :new
      expect(response).to redirect_to access_login_url
    end
  end

  describe 'simple access' do
    before :each do
      @user = create(:user, admin: 0)
      session[:user_id] = @user.id
      @timetable = create(:timetable)
    end

    describe 'GET#index' do
      it 'renders the :index view' do
        get :index
        expect(response).to be_ok
      end
    end

    describe 'GET#show' do
      it 'renders the :index view' do
        get :show, params: { id: @timetable }
        expect(response).to be_ok
      end
    end

    describe 'GET#new' do
      it 'renders the :index view' do
        # TODO
        get :new
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'admin access' do
    before :each do
      @user = create(:user)
      session[:user_id] = @user.id
      @timetable = create(:timetable)
    end

    describe 'GET#index' do
      it 'is gettable' do
        get :index
        expect(response).to be_ok
      end

      it 'renders the :index view' do
        get :index
        expect(response).to render_template(:index)
      end

    end

    describe 'GET #show' do
      it 'assigns the requested contact to @contact' do
        get :show, params: { id: @timetable }
        expect(assigns(:timetable)).to eq @timetable
      end

      it 'renders the :show template' do
        get :show, params: { id: @timetable }
        expect(response).to render_template(:show)
      end
    end

    describe 'GET #new' do
      it 'renders the :new template' do
        get :new
        expect(response).to render_template(:new)
        expect(assigns(:timetable)).to be_a_new(Timetable)
      end
    end

    describe 'POST #create' do
      context 'with valid attributes' do
        it 'create a new user and save in db' do
          expect{
            post :create, params: { timetable: attributes_for(:timetable) }
          }.to change(Timetable,:count).by(1)
        end

        it 'redirects to the show page' do
          post :create, params: { timetable: attributes_for(:timetable) }
          expect(response).to redirect_to(Timetable.last)
        end
      end

      context 'with invalid attributes' do
        it 'does not save the new contact in the database' do
          expect{
            post :create, params: { timetable: attributes_for(:timetable, amount_of_place: 0) }
          }.not_to change(Timetable,:count)
        end

        it 're-renders the :new template' do
          post :create, params: { timetable: attributes_for(:timetable, amount_of_place: 0) }
          expect(response).to render_template(:new)
        end
      end
    end

    describe 'PUT #update' do
      context 'with valid attributes' do
        it 'updates the contact in the database' do
          put :update, params: { id: @timetable, timetable: attributes_for(:timetable) }
          expect(assigns(:timetable)).to eq @timetable
        end

        it 'redirects to the contact' do
          put :update, params: { id: @timetable, timetable: attributes_for(:timetable) }
          expect(response).to redirect_to @timetable
        end
      end
    end
  end
end