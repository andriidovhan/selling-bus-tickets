require 'rails_helper'
require 'spec_helper'

describe UsersController do

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
    end

    describe 'GET#index' do
      it 'renders the :index view' do
        get :index
        expect(response).to be_ok
      end
    end

    describe 'GET#show' do
      it 'renders the :index view' do
        get :show, params: { id: @user }
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
        get :show, params: { id: @user }
        expect(assigns(:user)).to eq @user
      end

      it 'renders the :show template' do
        get :show, params: { id: @user }
        expect(response).to render_template(:show)
      end
    end

    describe 'GET #new' do
      it 'renders the :new template' do
        get :new
        expect(response).to render_template(:new)
        expect(assigns(:user)).to be_a_new(User)
      end
    end

    describe 'POST #create' do
      context 'with valid attributes' do
        it 'create a new user and save in db' do
          expect{
            post :create, params: { user: attributes_for(:user) }
          }.to change(User,:count).by(1)
        end

        it 'redirects to the show page' do
          post :create, params: { user: attributes_for(:user) }
          expect(response).to redirect_to(User.last)
        end
      end

      context 'with invalid attributes' do
        it 'does not save the new contact in the database' do
          expect{
            post :create, params: { user: attributes_for(:user, password: nil) }
          }.not_to change(User,:count)
        end

        it 're-renders the :new template' do
          post :create, params: { user: attributes_for(:user, password: nil) }
          expect(response).to render_template(:new)
        end
      end
    end

    describe 'PUT #update' do
      context 'with valid attributes' do
        it 'updates the contact in the database' do
          put :update, params: { id: @user, user: attributes_for(:user) }
          expect(assigns(:user)).to eq @user
        end

        it 'redirects to the contact' do
          put :update, params: { id: @user, user: attributes_for(:user) }
          expect(response).to redirect_to @user
        end
      end
    end
  end
end
