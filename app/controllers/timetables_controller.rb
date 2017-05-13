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

    respond_to do |format|
      if @timetable.save
        format.html { redirect_to @timetable, notice: 'New direction was successfully added to timetable.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @timetable = Timetable.find(params[:id])
  end

  def update
    @timetable = Timetable.find(params[:id])

    respond_to do |format|
      if @timetable.update(timetable_params)
        format.html { redirect_to @timetable, notice: 'Timetable was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def delete
    Timetable.find(params[:id]).destroy
    destroy
  end

  def destroy
    Timetable.find(params[:id]).destroy

    respond_to do |format|
      format.html { redirect_to timetables_url, notice: 'Direction from timetable was successfully removed.' }
    end
  end

  private
  def timetable_params
    params.require(:timetable).permit(:amount_of_place, :place_depart, :place_arrive, :time_depart, :time_arrive)
  end
end
