class DogsController < ApplicationController

    before_action :current_dog, only: [:show]
    
    def index
        @dogs = Dog.all
    end
    
    def show
        
    end

    def current_dog
        @dog = Dog.find(params[:id])
    end

    
    
end
