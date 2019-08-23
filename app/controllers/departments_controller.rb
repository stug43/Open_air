class DepartmentsController < ApplicationController
  def index
		@departments = Department.all
  end

  def show
		@department = Department.find(params[:id])
		@townships = @department.townships
  end
end
