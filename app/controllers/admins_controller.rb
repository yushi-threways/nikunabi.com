class AdminsController < Admins::ApplicationController
    before_action :set_admin
    before_action :authenticate_admin!
    layout "admins"

    def index
        @admins = Admin.all
    end


    private
    def set_admin
        Admin.find(params[:id])
    end
end