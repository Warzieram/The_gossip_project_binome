class UsersController < ApplicationController
  def show
    @user = User.find params[:id]
  end

  def new
    @user = User.new
  end

  def create
    filtered_params = params.except(:authenticity_token, :commit)
    cities = City.all.map { |city| city.name.upcase }
    entered_city = filtered_params[:city].upcase

    @user = User.new(filtered_params.permit(:first_name,
                                              :last_name,
                                              :age,
                                              :password,
                                              :email))
    if cities.include? entered_city
      @user.city = City.find_by name: entered_city
    else
      new_city = City.create(id: City.all.length+1, name: entered_city)
      @user.city = new_city
    end
    @user.id = User.all.length+1
    if @user.save
      flash[:notice] = "Inscription réalisée avec succès !"
      redirect_to gossips_path
    else
      flash[:alert] = "Error, veuillez vérifier votre entrée"
      render :new
    end
  end
end
