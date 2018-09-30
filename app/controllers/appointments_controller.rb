class AppointmentsController < ApplicationController
    def index
        @appointment = Appointment.new
        @appointments = Appointment.order('appointment_time DESC')
    end

    def create
        @appointment = Appointment.new(appointment_params)
        respond_to do |format|
            if @appointment.save
                @appointments = Appointment.order('appointment_time DESC')
                format.js { }
            end
        end

    end

    private

    def appointment_params
        params.require(:appointment).permit(:title,:appointment_time)
    end
end
