class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    validates_presence_of :nombre, :message => '^ El nombre del usuario no puede estar en blanco'
    validates_presence_of :apellido, :message => '^ El apellido del usuario no puede estar en blanco'
    validates_presence_of :fechaNacimiento ,:message => '^ La fecha del usuario no puede estar en blanco'
  
    validates_length_of :nombre, :maximum => 30
    validates_length_of :apellido, :maximum => 30
    
    has_attached_file :image, default_url: 'DefaultAvatar.jpg', styles: { medium: '200x200>', thumb: '48x48>' } 
    validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
    
    def admin?
      admin
    end
    
    
end