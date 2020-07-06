require '../controlador/factory.rb'

class Sistema
  def initialize()
    @listaClientes = Array.new
    @listaEquipos = Array.new
    @listaServicios = Array.new
  end

  def menuPrincipal()
    begin
      system('cls')
      puts
      puts
      puts "********** NOMBRE DE LA EMPRESA SAC. **********"
      puts
      puts "1. Registrar Cliente"
      puts "2. Registrar Equipo"
      puts "3. Registrar Servicio"
      puts "4. Búsquedas"
      puts "5. Reportes"
      puts "6. Salir"
      puts
      puts "Seleccione una opción: "
      opcion = gets.chomp.to_i
    end until(opcion >= 1 and opcion <= 6)

    case opcion
      when 1
        registrarCliente()
      when 2
        registrarEquipo()
      when 3
        registrarServicio()
      when 4
        busqueda()
      when 5
        reportes()
    end
  end

  def validarRegistro(array, key, valor)
    if array.length > 0
      array.each do |item|
        return item.send(key) === valor ? true : false
      end
    end
  end

  def registrarCliente()
    system('cls')
    puts
    puts "********** Registrar Cliente **********"
    puts
    puts "Ingresar DNI: "
    dni = gets.chomp
    puts "Ingresar nombre: "
    nombre = gets.chomp
    puts "Ingresar apellidos: "
    apellidos = gets.chomp.to_i
    puts "Ingresar teléfono: "
    telefono = gets.chomp.to_i

    # Validamos si un cliente con el mismo DNI ya existe
    cliente_existe = validarRegistro(@listaClientes, 'dni', dni)

    if cliente_existe
      puts "Ya existe un cliente registrado con el DNI: #{dni}"
      system('pause')
      menuPrincipal() 
    else
      cliente = Factory.registrarCliente(dni, nombre, apellidos, telefono)
      @listaClientes.push(cliente)
      puts
      puts "Cliente registrado correctamente"
      system('pause')
      menuPrincipal()
    end

  end

  def registrarEquipo()
    begin
      system('cls')
      puts
      puts "********** Registrar Equipo **********"
      puts
      puts "Tipo de equipo"
      puts "1. Computadora"
      puts "2. Laptop"
      puts "3. Impresora"
      puts "4. <- Regresar"
      puts
      puts "Seleccione una opción: "
      opcion = gets.chomp.to_i
    end until(opcion >= 1 and opcion <= 4)

    case opcion
      when 1
        registrarComputadora()
      when 2
        registrarLaptop()
      when 3
        registrarImpresora()
      when 4
        menuPrincipal()
    end
  end
  
  def registrarComputadora()
    system('cls')
    puts
    puts "********** Registrar Equipo: Computadora **********"
    puts
    puts "Ingresar DNI del cliente: "
    dni_cliente = gets.chomp
    puts "Ingresar marca: "
    marca = gets.chomp
    puts "Ingresar modelo: "
    modelo = gets.chomp.to_i
    puts "Ingresar número de serie: "
    serie = gets.chomp.to_i
    puts "Ingresar accesorios: "
    accesorios = gets.chomp.to_i

    # Validamos si el cliente existe
    cliente_existe = validarRegistro(@listaClientes, 'dni', dni_cliente)

    # Validamos si el equipo ya fue registrado
    equipo_existe = validarRegistro(@listaEquipos, 'serie', serie)

    if !cliente_existe
      puts "El cliente con DNI: #{dni_cliente} no existe."
      system('pause')
      registrarEquipo()
    elsif equipo_existe
      puts "Ya existe un equipo registrado con el nro. de serie: #{serie}"
      system('pause')
      registrarEquipo() 
    else
      computadora = Factory.registrarComputadora(dni_cliente, marca, modelo, serie, accesorios)
      @listaEquipos.push(computadora)
      puts
      puts "Computadora registrada correctamente"
      system('pause')
      registrarEquipo()
    end

  end

  def registrarLaptop()
    system('cls')
    puts
    puts "********** Registrar Equipo: Laptop **********"
    puts
    puts "Ingresar DNI del cliente: "
    dni_cliente = gets.chomp
    puts "Ingresar marca: "
    marca = gets.chomp
    puts "Ingresar modelo: "
    modelo = gets.chomp.to_i
    puts "Ingresar número de serie: "
    serie = gets.chomp.to_i
    puts "Ingresar pulgada: "
    pulgada = gets.chomp.to_i

    # Validamos si el cliente existe
    cliente_existe = validarRegistro(@listaClientes, 'dni', dni_cliente)

    # Validamos si el equipo ya fue registrado
    equipo_existe = validarRegistro(@listaEquipos, 'serie', serie)

    if !cliente_existe
      puts "El cliente con DNI: #{dni_cliente} no existe."
      system('pause')
      registrarEquipo()
    elsif equipo_existe
      puts "Ya existe un equipo registrado con el nro. de serie: #{serie}"
      system('pause')
      registrarEquipo() 
    else
      laptop = Factory.registarLaptop(dni_cliente, marca, modelo, serie, pulgada)
      @listaEquipos.push(laptop)
      puts
      puts "Laptop registrada correctamente"
      system('pause')
      registrarEquipo()
    end
  end

  def registrarImpresora()
    system('cls')
    puts
    puts "********** Registrar Equipo: Impresora **********"
    puts
    puts "Ingresar DNI del cliente: "
    dni_cliente = gets.chomp
    puts "Ingresar marca: "
    marca = gets.chomp
    puts "Ingresar modelo: "
    modelo = gets.chomp.to_i
    puts "Ingresar número de serie: "
    serie = gets.chomp.to_i
    puts "Ingresar tipo: "
    tipo = gets.chomp.to_i
    puts "Ingrasar nivel de tinta: "
    nivel_tinta = gets.chomp.to_i

    # Validamos si el cliente existe
    cliente_existe = validarRegistro(@listaClientes, 'dni', dni_cliente)

    # Validamos si el equipo ya fue registrado
    equipo_existe = validarRegistro(@listaEquipos, 'serie', serie)

    if !cliente_existe
      puts "El cliente con DNI: #{dni_cliente} no existe."
      system('pause')
      registrarEquipo()
    elsif equipo_existe
      puts "Ya existe un equipo registrado el con nro. de serie: #{serie}"
      system('pause')
      registrarEquipo() 
    else
      laptop = Factory.registrarImpresora(dni_cliente, marca, modelo, serie, tipo, nivel_tinta)
      @listaEquipos.push(laptop)
      puts
      puts "Impresora registrada correctamente"
      system('pause')
      registrarEquipo()
    end
  end

  def registrarServicio()
    begin
      system('cls')
      puts
      puts "********** Registrar Servicio **********"
      puts
      puts "Tipo de servicio"
      puts "1. Reparación"
      puts "2. Mantenimiento"
      puts "3. Instalación"
      puts "4. <- Regresar"
      puts
      puts "Seleccione una opción: "
      opcion = gets.chomp.to_i
    end until(opcion >= 1 and opcion <= 4)

    case opcion
      when 1
        registrarReparacion()
      when 2
        registrarMantenimiento()
      when 3
        registrarInstalacion()
      when 4
        menuPrincipal()
    end
  end

  def registrarReparacion()
    system('cls')
    puts
    puts "********** Registrar Servicio: Reparación **********"
    puts
    puts "Ingresar DNI del cliente: "
    dni_cliente = gets.chomp
    puts "Ingresar nro. de serie del equipo: "
    serie_equipo = gets.chomp
    fecha_internamiento = Time.now.strftime("%F")

    # Validamos si el cliente existe
    cliente_existe = validarRegistro(@listaClientes, 'dni', dni_cliente)

    # Validamos si el equipo ya fue registrado
    equipo_existe = validarRegistro(@listaEquipos, 'serie', serie_equipo)

    if !cliente_existe
      puts "El cliente con DNI: #{dni_cliente} no existe."
      system('pause')
      registrarServicio()
    elsif equipo_existe
      puts "Ya existe un equipo registrado con el nro. de serie: #{serie}"
      system('pause')
      registrarServicio() 
    else
      reparacion = Factory.registrarReparacion(dni_cliente, serie_equipo, fecha_internamiento)
      @listaServicios.push(reparacion)
      puts
      puts "Servicio de Reparación registrado correctamente"
      system('pause')
      registrarServicio()
    end
  end

  def registrarMantenimiento()
    system('cls')
    puts
    puts "********** Registrar Servicio: Mantenimiento **********"
    puts
    puts "Ingresar DNI del cliente: "
    dni_cliente = gets.chomp
    puts "Ingresar nro. de serie del equipo: "
    serie_equipo = gets.chomp
    fecha_internamiento = Time.now.strftime("%F")

    # Validamos si el cliente existe
    cliente_existe = validarRegistro(@listaClientes, 'dni', dni_cliente)

    # Validamos si el equipo ya fue registrado
    equipo_existe = validarRegistro(@listaEquipos, 'serie', serie_equipo)

    if !cliente_existe
      puts "El cliente con DNI: #{dni_cliente} no existe."
      system('pause')
      registrarServicio()
    elsif equipo_existe
      puts "Ya existe un equipo registrado con el nro. de serie: #{serie}"
      system('pause')
      registrarServicio() 
    else
      mantenimiento = Factory.registrarMantenimiento(dni_cliente, serie_equipo, fecha_internamiento)
      @listaServicios.push(mantenimiento)
      puts
      puts "Servicio de Mantenimiento registrado correctamente"
      system('pause')
      registrarServicio()
    end
  end

  def registrarInstalacion()
    system('cls')
    puts
    puts "********** Registrar Servicio: Instalación **********"
    puts
    puts "Ingresar DNI del cliente: "
    dni_cliente = gets.chomp
    puts "Ingresar nro. de serie del equipo: "
    serie_equipo = gets.chomp
    fecha_internamiento = Time.now.strftime("%F")

    # Validamos si el cliente existe
    cliente_existe = validarRegistro(@listaClientes, 'dni', dni_cliente)

    # Validamos si el equipo ya fue registrado
    equipo_existe = validarRegistro(@listaEquipos, 'serie', serie_equipo)

    if !cliente_existe
      puts "El cliente con DNI: #{dni_cliente} no existe."
      system('pause')
      registrarServicio()
    elsif equipo_existe
      puts "Ya existe un equipo registrado con el nro. de serie: #{serie}"
      system('pause')
      registrarServicio() 
    else
      instalacion = Factory.registrarInstalacion(dni_cliente, serie_equipo, fecha_internamiento)
      @listaServicios.push(instalacion)
      puts
      puts "Servicio de Instalación registrado correctamente"
      system('pause')
      registrarServicio()
    end
  end

  def busquedas()
  end

  def reportes()
  end

end

# 1. Registrar cliente
# 2. Registrar equipo
# 3. Registrar Servicio
# 4. Mostrar listado de clientes
# 5. Buscar servicios por dni del cliente: datos del cliente y servicios asociados
# 6. Ganancias totales de servicios
# 7. Ganancias totales por tipo de equipo
# 8. Ganancias totales por tipo de servicio

sis = Sistema.new()
sis.menuPrincipal()