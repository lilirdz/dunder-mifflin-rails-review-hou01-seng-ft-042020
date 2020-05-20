class EmployeesController < ApplicationController

    before_action :current_employee, only: [:show,:update,:edit]
    
    def index
        @employees = Employee.all
    end
    
    def show
        
    end

    def new
        @dogs = Dog.all
        @employee = Employee.new
    end

    def create
        employee = Employee.new(employee_params)
        if employee.valid?
            employee.save
            redirect_to employee
        else
          flash[:errors] = employee.errors.full_messages
          redirect_to "/employees/new"
        end
    end
    
    def edit
        @dogs = Dog.all
    end

    def update
        if @employee.update(employee_params)
            redirect_to employee_path(@employee)
        else 
            redirect_to "/employees/#{@employee.id}/edit"
        end 
    end
    

    def current_employee
        @employee = Employee.find(params[:id])
    end

    def employee_params
        params.require(:employee).permit(:first_name,:last_name,:alias,:title,:office,:dog_id)
    end
end
