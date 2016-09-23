require 'rails_helper'

RSpec.describe ActivitiesController, type: :controller do
  before :each do
    @user = create(:user)
    @activity = create(:activity)
    login_user(@user)
  end

  describe "get index" do
    it "should list @activities" do
      @first_aditional_activity = create(:activity)
      @second_adtional_activity = create(:activity)
      get :index
      expect(assigns(:activities)).to match_array([@activity, @first_aditional_activity, @second_adtional_activity])
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "get show" do
    it "assigns the requested activity to @activity" do
      get :show, id: @activity
      expect(assigns(:activity)).to eq @activity
    end

    it "renders the :show template" do
      get :show, id: @activity
      expect(response).to render_template :show
    end
  end

  describe "get new" do
    it "assigns a new Activity to @activity" do
      get :new
      expect(assigns(:activity)).to be_a_new(Activity)
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "post create" do
    it "saves the new activity in the database" do
      expect{
      post :create, activity: attributes_for(:activity, user_id: @user.id)
      }.to change(Activity, :count).by(1)
    end

    it "redirects to activities" do
      post :create, activity: attributes_for(:activity, user_id: @user.id)
      expect(response).to redirect_to :activities
    end
  end

  describe "put update" do
    it "update @activity's attribute" do
      patch :update, id: @activity, activity: attributes_for(:activity, name: 'Test')
      @activity.reload
      expect(@activity.name).to eq('Test')
    end

    it "redirects to activity" do
      patch :update, id: @activity, activity: attributes_for(:activity)
      expect(response).to redirect_to activity_path(@activity)
    end

    it "render the :edit template" do
      patch :update, id: @activity, activity: attributes_for(:activity, date_report: nil)
      @activity.reload
      expect(response).to render_template :edit
    end
  end

  describe "delete destroy" do
    it "deletes the activity" do
    expect{
    delete :destroy, id: @activity}
    .to change(Activity,:count).by(-1)
    end

    it "redirects to activity" do
    delete :destroy, id: @activity
    expect(response).to redirect_to :activities
    end
  end
end
