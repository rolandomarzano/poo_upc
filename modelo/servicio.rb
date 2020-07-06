class Servicio
  attr_accessor :dni_cliente, :serie_equipo, :fecha_internamiento
  def initialize(dni_cliente, serie_equipo, fecha_internamiento)
    @dni_cliente = dni_cliente
    @serie_equipo = serie_equipo
    @fecha_internamiento = fecha_internamiento
  end
end

class Reparacion < Servicio
  def initialize(dni_cliente, serie_equipo, fecha_internamiento)
    super(dni_cliente, serie_equipo, fecha_internamiento)
  end

  def costoReparacionPlaca()
    return 100
  end

  def costoReparacionFuente()
    return 80
  end
end

class Mantenimiento < Servicio
  def initialize(dni_cliente, serie_equipo, fecha_internamiento)
    super(dni_cliente, serie_equipo, fecha_internamiento)
  end

  def costoMantenimientoPreventivo()
    return 40
  end

  def costoMantenimientoCorrectivo()
    return 60
  end
end

class Instalacion < Servicio
  def initialize(dni_cliente, serie_equipo, fecha_internamiento)
    super(dni_cliente, serie_equipo, fecha_internamiento)
  end

  def costoInstalacionSO()
    return 50
  end

  def costoInstalacionProgramas()
    return 30
  end

  def costoInstalacionTinta()
    return 20
  end
end