class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #
  has_many :comments
  has_many :publications, through: :comments
  has_one_attached :photo

  # Start: *TODO: 
  # Validaciones, se crea el usuario se le asigna el rol
  validates :role, inclusion: { in: %w[normal admin] }
  # Enum de roles
  enum role: {
    normal: 'normal',
    admin: 'admin'
  }, _default: 'normal'
  # End: *TODO:

  # Start: *TODO:  "muestra name o email"      
  def full_name
    name.blank? ? email : name
  end
end
