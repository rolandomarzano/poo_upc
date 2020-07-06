require '../modelo/cliente.rb'
require '../modelo/equipo.rb'
require '../modelo/servicio.rb'

class Factory
  # Clientes
  def self.registrarCliente(nombres, apellidos, dni, telefono)
    cliente = Cliente.new(nombres, apellidos, dni, telefono)
    return cliente
  end

  # Equipos
  def self.registrarComputadora(dni_cliente, marca, modelo, serie, accesorios)
    computadora = Computadora.new(dni_cliente, marca, modelo, serie, accesorios)
    return computadora
  end

  def self.registarLaptop(dni_cliente, marca, modelo, serie, pulgada)
    laptop = Laptop.new(dni_cliente, marca, modelo, serie, pulgada)
    return laptop
  end

  def self.registrarImpresora(dni_cliente, marca, modelo, serie, tipo, nivel_tinta)
    impresora = Impresora.new(dni_cliente, marca, modelo, serie, tipo, nivel_tinta)
    return impresora
  end

  # Servicios
  def self.registrarReparacion(dni_cliente, serie_equipo, fecha_internamiento)
    reparacion = Reparacion.new(dni_cliente, serie_equipo, fecha_internamiento)
    return reparacion
  end

  def self.registarMantenimiento(dni_cliente, serie_equipo, fecha_internamiento)
    mantenimiento = Mantenimiento.new(dni_cliente, serie_equipo, fecha_internamiento)
    return mantenimiento
  end

  def self.registarInstalacion(dni_cliente, serie_equipo, fecha_internamiento)
    instalacion = Instalacion.new(dni_cliente, serie_equipo, fecha_internamiento)
    return instalacion
  end

end