class PeopleController < ApplicationController
	include ActiveModel::ForbiddenAttributesProtection
# Public: Get the actual age of a person based on his/her birthday
#
# Examples
#   person.age
#   # => 25
#
# Returns the age of a person.
	def index
		@people = Person.all.order(:first_name, :last_name)
	end

	def show
		@person = Person.find(params[:id])
	end

	def new
		@person = Person.new
	end

	def create
		@person = Person.new(person_params)
		if @person.save
			
		else
			render :new
		end
	end

	def edit
		@person = Person.find(params[:id])
	end

	def update
		@person = Person.find(params[:id])
		if @person.update(person_params)
			redirect_to people_path
		else
			render :edit
		end
	end

	def destroy
		@person = Person.find(params[:id])
		@person.destroy
		redirect_to people_path
	end

	def person_params
    params.require(:person).permit(:first_name, :last_name, :email, :job, :bio, :gender, :birthdate, :picture)
  end
end
