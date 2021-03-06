class EventsController < ApplicationController
  def eventer
    @event = Event.new
  end
  def plan
    param = params[:event]
    if param[:e_key] != nil and param[:e_name] != nil then
        @event = Event.new
        @event.e_name = param[:e_name]
        @event.e_key = param[:e_key]
        @event.e_detail = param[:e_detail]
        @event.e_location = param[:e_location]
        @event.e_host = current_user.email
        @event.save
        render :text => params.to_s
    end
  end
  def event_detail
    @event = Event.where(e_key: params[:e_key])
  end
end
