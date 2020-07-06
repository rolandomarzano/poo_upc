class Cliente
  attr_accessor :dni, :nombre, :apellidos, :telefono
  def initialize(dni, nombre, apellidos, telefono)
    @dni = dni
    @nombre = nombre
    @apellidos = apellidos
    @telefono = telefono
  end
end