class TicketsController < ApplicationController

  layout 'custom'

  def edit
    @ticket = Ticket.find(params[:id])
    update
  end

  def update
    @ticket = Ticket.find(params[:id])

    unless check_ticket_is_bought_to_specific_bus
      respond_to do |format|
        if @ticket.update(user_id: session[:user_id], available: false)
          format.html { redirect_to "/timetables/#{Ticket.find(params[:id]).timetable_id}", notice: 'Ticket was successfully bought.' }
        else
          format.html { redirect_to "/timetables/#{Ticket.find(params[:id]).timetable_id}", notice: 'Ticket was NOT bought.' }
        end
      end
    end
  end

  def my_tickets
    @tickets = Ticket.where(user_id: session[:user_id])
    render 'my_tickets'
  end

  private

  def check_ticket_is_bought_to_specific_bus
    if Ticket.where(timetable_id: @ticket.timetable_id).where(user_id: session[:user_id]).count >= 1
      redirect_to "/timetables/#{Ticket.find(params[:id]).timetable_id}", notice: 'Sorry, you have already bought ticket on that bus.'
    end
  end
end
