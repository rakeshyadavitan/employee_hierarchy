class EmployeesController < ApplicationController

	before_action :set_employee, only: [:hierarchy, :resign]

	def index
    @employees = Employee.active_employees
    json_response(@employees)
  end

  def create
    @employee = Employee.create!(employee_params)
    json_response(@employee, :created)
  end

  def hierarchy
  	hierarchy = {}
  	hierarchy['employee_name'] = @employee.name
  	hierarchy['manager'] = @employee.manager.try(:name)
  	hierarchy['director'] = @employee.director.try(:name)
  	hierarchy['vp'] = @employee.vp.try(:name)
  	hierarchy['ceo'] = Employee.ceo.pluck(:name).join(',')
  	json_response(hierarchy)
  end

  def salary
  	salary = Employee.select('id, name, salary').order('salary desc').limit(params[:limit])
  	json_response(salary)
  end

  def resign
  	manager_subs = @employee.manager_subs
  	manager = @employee.manager   
  	@employee.update_attributes(resign: true)  	
	  manager_subs.update_all(manager_id: manager.id) if manager_subs.present?
	  json_response(@employee)
  end

  private

  def employee_params
  	params.permit(:name, :manager_id, :director_id, :vp_id, :salary, :resign)
  end

  def set_employee
  	@employee = Employee.find(params[:id])
  end

end
