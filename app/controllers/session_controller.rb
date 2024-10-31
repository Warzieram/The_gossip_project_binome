class SessionController < ApplicationController
  def new
    filtered_params = params.except(:authenticity_token, :commit)

    user = User.find_by(email: filtered_params[:email])
    if user && user.authenticate(filtered_params[:password])

      log_in(user)
      flash[:notice] = nil
      redirect_to gossips_path

    else
      flash[:notice] = "E-mail et/ou mot de passe incorrect(s)"
    end
  end

  def Create
  end

  def destroy
    log_out
    redirect_to gossips_path
  end
end
