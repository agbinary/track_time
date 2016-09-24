require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  before :each do
    @user = create(:user)
    @project = create(:project)
    login_user(@user)
  end

  describe "get index" do
    it "should list @projects" do
      @first_aditional_project = create(:project)
      @second_adtional_project = create(:project)
      get :index
      expect(assigns(:projects)).to match_array([@project, @first_aditional_project, @second_adtional_project])
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "get show" do
    it "assigns the requested project to @project" do
      get :show, id: @project
      expect(assigns(:project)).to eq @project
    end

    it "renders the :show template" do
      get :show, id: @project
      expect(response).to render_template :show
    end
  end

  describe "get new" do
    it "assigns a new Project to @project" do
      get :new
      expect(assigns(:project)).to be_a_new(Project)
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "post create" do
    it "saves the new project in the database" do
      expect{
      post :create, project: attributes_for(:project, user_id: @user.id)
    }.to change(Project, :count).by(1)
    end

    it "redirects to activities" do
      post :create, project: attributes_for(:project, user_id: @user.id)
      expect(response).to redirect_to :activities
    end
  end

  describe "put update" do
    it "update @project's attribute" do
      patch :update, id: @project, project: attributes_for(:project, name: 'Test')
      @project.reload
      expect(@project.name).to eq('Test')
    end

    it "redirects to project" do
      patch :update, id: @project, project: attributes_for(:project)
      expect(response).to redirect_to project_path(@project)
    end

    it "render the :edit template" do
      patch :update, id: @project, project: attributes_for(:project, name: nil)
      @project.reload
      expect(response).to render_template :edit
    end
  end

  describe "delete destroy" do
    it "deletes the project" do
    expect{
    delete :destroy, id: @project}
    .to change(Project,:count).by(-1)
    end

    it "redirects to activity" do
    delete :destroy, id: @project
    expect(response).to redirect_to :activities
    end
  end
end
