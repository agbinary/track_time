class ActivitiesController < ApplicationController
  before_action :require_login
  before_action :find_activity, only: [:show, :edit, :update, :update_status, :destroy]

  def index
    @activities = Activity.all.order(date_report: :desc, created_at: :desc)
    @activities_by_day = @activities.group_by { |activity| activity.date_report }
  end

  def show
  end

  def new
    @activity = Activity.new
  end

  def new_timer
    @activity = Activity.new
  end

  def create_timer
    @activity = Activity.new(activity_attributes)
    @activity.user = current_user
    @activity.start_time = Time.now
    @activity.date_report = Date.today
    @activity.status = 'open'
    @activity.track_type = 'timer'
    if @activity.save
      redirect_to :activities, notice: 'Counting!'
    else
      render :new
    end
  end

  def create
    @activity = Activity.new(activity_attributes)
    @activity.user = current_user
    @activity.status = 'close'
    @activity.track_type = 'manual'
    if @activity.save
      @activity.update(total_time: @activity.calculate_total_time)
      redirect_to :activities, notice: 'Activity Saved!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @activity.assign_attributes(activity_attributes)
    if @activity.save
      flash[:success] = 'Activity Updated!'
      redirect_to activity_path(@activity)
    else
      render :edit
    end
  end

  def update_status
    if @activity.open?
      @activity.update(status: 'close', end_time: Time.now)
      @activity.update(total_time: @activity.calculate_total_time)
    else
      Activity.create(track_type: 'timer', status: 'open', name: @activity.name, start_time: Time.now, date_report: Date.today, user: current_user, project: @activity.project)
    end
    redirect_to :activities
  end

  def destroy
    @activity.destroy
    redirect_to :activities
  end

  private

  def activity_attributes
    params.require(:activity).permit(:name, :start_time, :end_time, :date_report, :project_id)
  end

  def find_activity
    @activity = Activity.find(params[:id])
  end
end
