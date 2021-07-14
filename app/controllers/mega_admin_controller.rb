class MegaAdminController < ApplicationController
    def index
        @companies = Company.all
    end
end
