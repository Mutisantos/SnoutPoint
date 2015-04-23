# Clase que se encarga de controlar las acciones concernientes a los objetos de tipo User
class UsersController < ApplicationController
  
  load_and_authorize_resource
  
  #Define los parámetros que son alterables por el controlador
  def user_params
      params.require(:user).permit(:nombre, :apellido, :email, :password, :password_confirmation, :fechaNacimiento, :image, :genero, :admin)
  end
  
  # Método que accede a los registros de de tipo User 
  # * *Resultado*     :
  #   - se asigna a la variable @user una lista con objetos de tipo User encontrados en la base de datos
  def index
    @users = User.all
  end

  # Método que busca un registro de tipo User
  # * *Parámetros*    :
  #   - +id+ -> identificador único del objeto de tipo User
  # * *Resultado*     :
  #   - se asigna a la variable @user el objeto de tipo User encontrado en la base de datos
  def show
    @user = User.find(params[:id])
  end

  # Método que prepara un objeto de tipo User vacío
  # * *Resultado*     :
  #   - Se asigna a la varibla @user un objeto vacío de tipo User 
  def new
    @user = User.new
   
  end

  # Método que busca un registro de tipo User y prepararlo para su edición
  # * *Parámetros*    :
  #   - +id+ -> identificador único del objeto de tipo User
  # * *Resultado*     :
  #   - Se almacena el objeto de tipo User en la variable @user para ser usado en la vista correspondiente
  def edit
    @user = User.find(params[:id])
  end

  # Método que guarda un objeto de tipo User en la base de datos
  # * *Parámetros*    :
  #   - +email+ -> String Correo electrónico 
  #   - +password+ -> String Constraseña
  #   - +password_confirmation+ -> String de confirmación de contraseña
  # * *Resultado*     :
  #   - El objeto de tipo User se guarda en la base de datos
  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to @user, :flash => { :success => 'Usuario creado exitosamente.' }
    else
      render :action => 'new'
    end
  end

 
 

  
  # Método que elimina un registro de tipo 
  # * *Parámetros*    :
  #   - +id+ -> identificador único del registro de tipo User
  # * *Resultado* :
  #   - El objeto de tipo User se elimina exitosamente de la base de datos
  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "Usuario: " + @user.nombre + " fue eliminado satisfactoriamente."
      redirect_to :back
    end
  end 
  
  
  
end