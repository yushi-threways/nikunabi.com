class AdminsController < Admins::ApplicationController
    before_action :set_admin, only: [:edit, :update]
    before_action :authenticate_admin!, only: [:show, :edit, :update]
    layout "admins", only: [:show, :edit, :update]

    def index
        @admins = Admin.all
    end

    def show
    end

    private
    def set_admin
        Admin.find(params[:id])
    end
end