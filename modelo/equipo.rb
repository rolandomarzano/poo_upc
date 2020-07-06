class Equipo
  attr_accessor :dni_cliente, :marca, :modelo, :serie
  def initialize(dni_cliente, marca, modelo, serie)
    @marca = marca
    @modelo = modelo
    @serie = serie
  end
end

class Computadora < Equipo
  attr_accessor :accesorios
  def initialize(dni_cliente, marca, modelo, serie, accesorios)
    super(dni_cliente, marca, modelo, serie)
    # Accesorios y/o periféricos de la pc
    @accesorios = accesorios
  end
end

class Laptop < Equipo
  attr_accessor :pulgada
  def initialize(dni_cliente, marca, modelo, serie, pulgada)
    super(dni_cliente, marca, modelo, serie)
    # Tamaño de la pantalla de la laptop
    @pulgada = pulgada    
  end
end

class Impresora < Equipo
  attr_accessor :tipo, :nivel_tinta
  def initialize(dni_cliente, marca, modelo, serie, tipo, nivel_tinta)
    super(dni_cliente, marca, modelo, serie)
    # Cartucho o Sistema continuo
    @tipo = tipo
    # Puede ser:
    # bajo => 1
    # medio => 2
    # alto => 3
    @nivel_tinta = nivel_tinta 
  end
end