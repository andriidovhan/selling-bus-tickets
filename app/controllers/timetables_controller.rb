class TimetablesController < ApplicationController
  def index
    @timetables = Timetable.all
  end

  def show
    @timetable = Timetable.find(params[:id])
  end

  def new
    @timetable = Timetable.new
  end

  def create
    @timetable = Timetable.new(timetable_params)
    @timetable.save
    redirect_to @timetable
  end

  def edit
    @timetable = Timetable.find(params[:id])
  end

  def update
    @timetable = Timetable.find(params[:id])
    @timetable.update(timetable_params)
    redirect_to @timetable
  end

  def delete
    Timetable.find(params[:id]).destroy
    destroy
  end

  def destroy
    Timetable.find(params[:id]).destroy
    redirect_to timetables_url
  end

  private
  def timetable_params
    params.require(:timetable).permit(:amount_of_place, :place_depart, :place_arrive, :time_depart, :time_arrive)
  end
end
