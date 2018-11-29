class Admins::TopController < Admins::ApplicationController
    before_action :set_admin
    before_action :authenticate_admin!
    layout "admins"

    def index
        @admins = current_admin
    end
end