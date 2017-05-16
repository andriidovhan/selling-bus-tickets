class TimetablesController < ApplicationController
  helper_method :sort_column, :sort_direction

  layout 'custom'

  def index
    remove_old_direction
    params[:sort] ||= 'time_depart'
    @timetables = Timetable.order(params[:sort].to_s + " " + params[:direction].to_s)
  end

  def show
    begin
      @timetable = Timetable.find(params[:id])
      @tickets = @timetable.tickets
    rescue
      redirect_to timetables_path, notice: "The requested direction with id: '#{params[:id]}' was not found."
    end
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
    params.require(:timetable).permit(:amount_of_place, :place_depart, :place_arrive, :time_depart, :time_arrive, :price)
  end

  def sort_column
    Timetable.column_names.include?(params[:sort]) ? params[:sort] : "place_depart"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def remove_old_direction
    Timetable.all.each  do |direction|
      direction.destroy if direction.time_depart < Time.now
    end
  end
end
