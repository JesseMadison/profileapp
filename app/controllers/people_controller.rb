class PeopleController < ApplicationController


  def New

  end

  def create
    # render plain: params[:people].inspect
    @person = Person.new(person_params)
    @person.save
    redirect_to people_path
  end

  def index
    #fetches all the db data
    @people = Person.all
  end

  def edit
    #params are used when getting information passed via the url or data being passed from the form
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])
    @person.update(person_params)
    redirect_to person_path
  end

  def show
    @person = Person.find(params[:id])
  end

  def destroy
    @person = Person.find(params[:id])
    @person.destroy
    redirect_to people_path
  end
  private


  def person_params
    params.require(:person).permit(:name, :age)
  end
end
