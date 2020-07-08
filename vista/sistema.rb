require '../controlador/factory.rb'

class Sistema
  attr_accessor :correlativo
  def initialize()
    @listaClientes = Array.new
    @listaEquipos = Array.new
    @listaServicios = Array.new
    @correlativo = 0
  end

  def menuPrincipal()
    begin
      system('cls')
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
        busquedas()
      when 5
        reportes()
    end
  end

  def validarRegistro(array, key, valor)
    if array.length > 0
      array.each do |item|
        return item.send(key) === valor ? item : false
      end
    end
  end

  def validarRegistroInstancia(array, key, valor, instancia)
    if array.length > 0
      array.each do |item|
        array.instance_of? instancia
        return item.send(key) === valor ? item : false
      end
    end
  end

  def validarServicio(array, key, valor)
    array.each do |item|
      return item.send(key) === valor ? item : false
    end
  end

  # Registros
  def registrarCliente()
    system('cls')
    puts
    puts "********** Registrar Cliente **********"
    puts
    puts "Ingresar DNI: "
    dni = gets.chomp
    puts "Ingresar nombre: "
    # Validamos si un cliente con el mismo DNI ya existe
    cliente_existe = validarRegistro(@listaClientes, 'dni', dni)

    if cliente_existe
      puts "Ya existe un cliente registrado con el DNI: #{dni}"
      system('pause')
      registrarCliente() 
    end

    nombre = gets.chomp
    puts "Ingresar apellidos: "
    apellidos = gets.chomp
    puts "Ingresar teléfono: "
    telefono = gets.chomp.to_i

    cliente = Factory.registrarCliente(dni, nombre, apellidos, telefono)
    @listaClientes.push(cliente)
    puts
    puts "Cliente registrado correctamente."
    system('pause')
    menuPrincipal()

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

    # Validamos si el cliente existe
    cliente_existe = validarRegistro(@listaClientes, 'dni', dni_cliente)
    if !cliente_existe
      puts "El cliente con DNI: #{dni_cliente} no existe."
      system('pause')
      registrarComputadora()
    end

    puts "Ingresar marca: "
    marca = gets.chomp
    puts "Ingresar modelo: "
    modelo = gets.chomp
    puts "Ingresar número de serie: "
    serie = gets.chomp

    # Validamos si el equipo ya fue registrado
    equipo_existe = validarRegistro(@listaEquipos, 'serie', serie)
    if equipo_existe
      puts "Ya existe un equipo registrado con el nro. de serie: #{serie}"
      system('pause')
      registrarComputadora()
    end

    puts "Ingresar accesorios: "
    accesorios = gets.chomp

    computadora = Factory.registrarComputadora(dni_cliente, marca, modelo, serie, accesorios)
    @listaEquipos.push(computadora)
    puts
    puts "Computadora registrada correctamente."
    system('pause')
    registrarEquipo()

  end

  def registrarLaptop()
    system('cls')
    puts
    puts "********** Registrar Equipo: Laptop **********"
    puts
    puts "Ingresar DNI del cliente: "
    dni_cliente = gets.chomp

    # Validamos si el cliente existe
    cliente_existe = validarRegistro(@listaClientes, 'dni', dni_cliente)
    if !cliente_existe
      puts "El cliente con DNI: #{dni_cliente} no existe."
      system('pause')
      registrarLaptop()
    end

    puts "Ingresar marca: "
    marca = gets.chomp
    puts "Ingresar modelo: "
    modelo = gets.chomp
    puts "Ingresar número de serie: "
    serie = gets.chomp

    # Validamos si el equipo ya fue registrado
    equipo_existe = validarRegistro(@listaEquipos, 'serie', serie)
    if equipo_existe
      puts "Ya existe un equipo registrado con el nro. de serie: #{serie}"
      system('pause')
      registrarLaptop()
    end

    puts "Ingresar pulgada: "
    pulgada = gets.chomp.to_i

    laptop = Factory.registrarLaptop(dni_cliente, marca, modelo, serie, pulgada)
    @listaEquipos.push(laptop)
    puts
    puts "Laptop registrada correctamente."
    system('pause')
    registrarEquipo()

  end

  def registrarImpresora()
    system('cls')
    puts
    puts "********** Registrar Equipo: Impresora **********"
    puts
    puts "Ingresar DNI del cliente: "
    dni_cliente = gets.chomp

    # Validamos si el cliente existe
    cliente_existe = validarRegistro(@listaClientes, 'dni', dni_cliente)
    if !cliente_existe
      puts "El cliente con DNI: #{dni_cliente} no existe."
      system('pause')
      registrarImpresora()
    end

    puts "Ingresar marca: "
    marca = gets.chomp
    puts "Ingresar modelo: "
    modelo = gets.chomp
    puts "Ingresar número de serie: "
    serie = gets.chomp

    # Validamos si el equipo ya fue registrado
    equipo_existe = validarRegistro(@listaEquipos, 'serie', serie)
    if equipo_existe
      puts "Ya existe un equipo registrado el con nro. de serie: #{serie}"
      system('pause')
      registrarImpresora()
    end

    puts "Ingresar tipo: "
    tipo = gets.chomp
    puts "Ingrasar nivel de tinta: "
    nivel_tinta = gets.chomp.to_i

    laptop = Factory.registrarImpresora(dni_cliente, marca, modelo, serie, tipo, nivel_tinta)
    @listaEquipos.push(laptop)
    puts
    puts "Impresora registrada correctamente."
    system('pause')
    registrarEquipo()

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

    # Validamos si el cliente existe
    cliente_existe = validarRegistro(@listaClientes, 'dni', dni_cliente)
    if !cliente_existe
      puts "El cliente con DNI: #{dni_cliente} no existe."
      system('pause')
      registrarReparacion()
    end

    puts "Ingresar nro. de serie del equipo: "
    serie_equipo = gets.chomp

    # Validamos si el equipo ya fue registrado
    equipo_existe = validarRegistro(@listaEquipos, 'serie', serie_equipo)
    if !equipo_existe
      puts "El equipo con el nro. de serie: #{serie_equipo} no existe"
      system('pause')
      registrarReparacion() 
    end

    # Validamos si el equipo ya se encuentra en Reparación
    equipo_reparacion = validarRegistroInstancia(@listaServicios, 'serie_equipo', serie_equipo, Reparacion)
    if equipo_reparacion
      puts "El equipo con nro. de serie: #{serie_equipo} ya se encuentra en servicio de Reparación."
      system('pause')
      registrarServicio()
    end

    puts "¿Reparación de placa?"
    puts "1. (Si) / 2. (No)"
    opcion1 = gets.chomp.to_i

    # Costo de reparación de placa
    if opcion1 === 1
      rep_placa = 100
    else
      rep_placa = 0
    end

    puts "¿Reparación de fuente?"
    puts "1. (Si) / 2. (No)"

    # Costo de reparación de fuente
    opcion2 = gets.chomp.to_i
    if opcion2 === 1
      rep_fuente = 80
    else
      rep_fuente = 0
    end

    fecha_internamiento = Time.now.strftime("%F")

    # Generamos el código
    @correlativo = @correlativo + 1
    codigo = "SERV-#{@correlativo.to_s.rjust(4, "0")}"

    reparacion = Factory.registrarReparacion(codigo, dni_cliente, serie_equipo, fecha_internamiento, rep_placa, rep_fuente)
    @listaServicios.push(reparacion)
    puts
    puts "Servicio de Reparación registrado correctamente."
    puts "--- Código de Servicio: #{codigo} ---"
    system('pause')
    registrarServicio()

  end

  def registrarMantenimiento()
    system('cls')
    puts
    puts "********** Registrar Servicio: Mantenimiento **********"
    puts
    puts "Ingresar DNI del cliente: "
    dni_cliente = gets.chomp

    # Validamos si el cliente existe
    cliente_existe = validarRegistro(@listaClientes, 'dni', dni_cliente)
    if !cliente_existe
      puts "El cliente con DNI: #{dni_cliente} no existe."
      system('pause')
      registrarMantenimiento()
    end

    puts "Ingresar nro. de serie del equipo: "
    serie_equipo = gets.chomp

    # Validamos si el equipo ya fue registrado
    equipo_existe = validarRegistro(@listaEquipos, 'serie', serie_equipo)
    if !equipo_existe
      puts "El equipo con el nro. de serie: #{serie_equipo} no existe"
      system('pause')
      registrarMantenimiento() 
    end

    # Validamos si el equipo ya se encuentra en Mantenimiento
    equipo_mantenimiento = validarRegistroInstancia(@listaServicios, 'serie_equipo', serie_equipo, Mantenimiento)
    if equipo_mantenimiento
      puts "El equipo con nro. de serie: #{serie_equipo} ya se encuentra en servicio de Mantenimiento."
      system('pause')
      registrarServicio()
    end

    puts "¿Mantenimiento preventivo?"
    puts "1. (Si) / 2. (No)"
    opcion1 = gets.chomp.to_i

    # Costo mantenimiento preventivo
    if opcion1 === 1
      mant_prev = 40
    else
      mant_prev = 0
    end

    puts "¿Mantenimiento correctivo?"
    puts "1. (Si) / 2. (No)"

    # Costo mantenimiento correctivo
    opcion2 = gets.chomp.to_i
    if opcion2 === 1
      mant_corr = 60
    else
      mant_corr = 0
    end

    fecha_internamiento = Time.now.strftime("%F")

    # Generamos el código
    @correlativo = @correlativo + 1
    codigo = "SERV-#{@correlativo.to_s.rjust(4, "0")}"

    mantenimiento = Factory.registrarMantenimiento(codigo, dni_cliente, serie_equipo, fecha_internamiento, mant_prev, mant_corr)
    @listaServicios.push(mantenimiento)
    puts
    puts "Servicio de Mantenimiento registrado correctamente."
    puts "--- Código de Servicio: #{codigo} ---"
    system('pause')
    registrarServicio()

  end

  def registrarInstalacion()
    system('cls')
    puts
    puts "********** Registrar Servicio: Instalación **********"
    puts
    puts "Ingresar DNI del cliente: "
    dni_cliente = gets.chomp

    # Validamos si el cliente existe
    cliente_existe = validarRegistro(@listaClientes, 'dni', dni_cliente)
    if !cliente_existe
      puts "El cliente con DNI: #{dni_cliente} no existe."
      system('pause')
      registrarInstalacion()
    end

    puts "Ingresar nro. de serie del equipo: "
    serie_equipo = gets.chomp

    # Validamos si el equipo ya fue registrado
    equipo_existe = validarRegistro(@listaEquipos, 'serie', serie_equipo)
    if !equipo_existe
      puts "El equipo con el nro. de serie: #{serie_equipo} no existe"
      system('pause')
      registrarInstalacion() 
    end

    # Validamos si el equipo ya se encuentra en Instalación
    equipo_instalacion = validarRegistroInstancia(@listaServicios, 'serie_equipo', serie_equipo, Instalacion)
    if equipo_instalacion
      puts "El equipo con nro. de serie: #{serie_equipo} ya se encuentra en servicio de Instalación."
      system('pause')
      registrarServicio()
    end

    puts "¿Instalación de SO.?"
    puts "1. (Si) / 2. (No)"
    opcion1 = gets.chomp.to_i

    # Costo instalación de so
    if opcion1 === 1
      inst_so = 50
    else
      inst_so = 0
    end

    puts "¿¿Instalación de Programas?"
    puts "1. (Si) / 2. (No)"
    opcion2 = gets.chomp.to_i

    # Costo instalación de programas
    if opcion2 === 1
      inst_prog = 30
    else
      inst_prog = 0
    end

    puts "¿Instalación de tinta?"
    puts "1. (Si) / 2. (No)"
    opcion3 = gets.chomp.to_i

    # Costo instalación de tinta
    if opcion3 === 1
      inst_tinta = 20
    else
      inst_tinta = 0
    end

    fecha_internamiento = Time.now.strftime("%F")

    # Generamos el código
    @correlativo = @correlativo + 1
    codigo = "SERV-#{@correlativo.to_s.rjust(4, "0")}"

    instalacion = Factory.registrarInstalacion(codigo, dni_cliente, serie_equipo, fecha_internamiento, inst_so, inst_prog, inst_tinta)
    @listaServicios.push(instalacion)
    puts
    puts "Servicio de Instalación registrado correctamente."
    puts "--- Código de Servicio: #{codigo} ---"
    system('pause')
    registrarServicio()

  end

  # Búsquedas
  def busquedas()
    begin
      system('cls')
      puts
      puts "********** Búsquedas **********"
      puts
      puts "1. Buscar Cliente"
      puts "2. Buscar Equipo"
      puts "3. Buscar Servicio"
      puts "4. <- Regresar"
      puts
      puts "Seleccione una opción: "
      opcion = gets.chomp.to_i
    end until(opcion >= 1 and opcion <= 4)

    case opcion
      when 1
        buscarCliente()
      when 2
        buscarEquipo()
      when 3
        buscarServicio()
      when 4
        menuPrincipal()
    end
  end

  def buscarCliente()
    system('cls')
    puts
    puts "********** Buscar Cliente **********"
    puts
    puts "Ingresar DNI del cliente: "
    dni_cliente = gets.chomp
   
    # Validamos si el cliente ya fue registrado
    existe = false

    @listaClientes.each do |cliente|
      if cliente.dni === dni_cliente
        puts cliente.mostrarDatos()
        existe = true
      end
    end

    if existe === false
      puts "No se encontró el cliente con DNI: #{dni_cliente}"
    end

    system('pause')
    busquedas()

  end

  def buscarEquipo()
    system('cls')
    puts
    puts "********** Buscar Equipo **********"
    puts
    puts "Ingresar nro. de serie del equipo: "
    serie_equipo = gets.chomp

    # Validamos si el equipo ya fue registrado
    existe = false

    @listaEquipos.each do |equipo|
      if equipo.serie === serie_equipo
        puts equipo.mostrarDatos()
        existe = true
      end
    end

    if existe === false
      puts "El equipo con nro de serie: #{serie_equipo} no existe."
    end

    system('pause')
    busquedas()
  end

  def buscarServicio()
    system('cls')
    puts
    puts "********** Buscar Servicio **********"
    puts
    puts "Ingresar el código de servicio: "
    codigo_servicio = gets.chomp

    # Validamos si el servicio ya fue generado
    existe = false

    @listaServicios.each do |servicio|
      if servicio.codigo === codigo_servicio
        # Capturamos en equipo
        equipo = validarRegistro(@listaEquipos, 'serie', servicio.serie_equipo)
        puts servicio.mostrarDatos(equipo.class.name)

        existe = true
      end
    end

    if existe === false
      puts "El servicio con el código: #{codigo_servicio} no existe."
    end

    system('pause')
    busquedas()

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