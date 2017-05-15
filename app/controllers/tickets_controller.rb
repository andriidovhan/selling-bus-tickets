class TicketsController < ApplicationController
  def edit
    @ticket = Ticket.find(params[:id])
    update
  end

  def update
    @ticket = Ticket.find(params[:id])

    respond_to do |format|
      if @ticket.update(user_id: session[:user_id], available: false)
        format.html { redirect_to "/timetables/#{Ticket.find(params[:id]).timetable_id}", notice: 'Ticket was successfully bought.' }
      else
        format.html { redirect_to "/timetables/#{Ticket.find(params[:id]).timetable_id}", notice: 'Ticket was NOT bought.' }
      end
    end
  end
end
