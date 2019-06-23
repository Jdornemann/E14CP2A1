class EmployeesController < ApplicationController

  def show
    @employee = Employee.new

  end

  def destroy

    @employee = Employee.find(params[:id])
    if @employee.present?
      @employee.destroy
    end
    
    respond_to do |format|
      format.html { redirect_to @employee.company, notice: 'employee was successfully destroyed.' }
      format.json { head :no_content }
    end

  end

  def create

    @employee = Employee.new(employee_params)

      respond_to do |format|
          if @employee.save
            format.html { redirect_to @employee.company, notice: 'Employee was successfully created.' }
            format.json { render :show, status: :created, location: @category }
          else
            format.html { render :new }
            format.json { render json: @employee.errors, status: :unprocessable_entity }
          end
        end

  end

  def employee_params
      params.require(:employee).permit(:first_name, :last_name, :email)
  end 

end
