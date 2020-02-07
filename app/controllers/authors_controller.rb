class AuthorsController < ApplicationController
    def index
        @authors = Author.all.order(:last_name)
    end

    def show
        @author = Author.find(params[:id])
    end 


end
