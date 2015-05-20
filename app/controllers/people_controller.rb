class PeopleController < ApplicationController

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)
    if @person.save
      redirect_to @person
    else
      render :new
    end
  end
  def show
    @person = Person.find(params[:id])
  end

end

def person_params
  params.require(:person).permit(:first_name, :last_name, :email, :phone)


end

