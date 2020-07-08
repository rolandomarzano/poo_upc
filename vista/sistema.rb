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
    objeto = false
    if array.length > 0
      array.each do |item|
        if item.send(key) === valor
          objeto = item
        end
      end
    end
    return objeto
  end

  def validarRegistroInstancia(array, key, valor, instancia)
    if array.length > 0
      array.each do |item|
        array.instance_of? instancia
        return item.send(key) === valor ? item : false
      end
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
    puts "1. (Cartucho) / 2. (Contínuo)"
    opcion = gets.chomp
    if opcion === 1
      tipo = "Cartucho"
    else
      tipo = "Continuo"      
    end

    puts "Ingrasar nivel de tinta: "
    puts "1. (Bajo) / 2. (Medio) / 3. (Alto)"
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
      puts "El equipo con nro. de serie: #{serie_equipo} ya se encuentra en servicio."
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
      puts "El equipo con nro. de serie: #{serie_equipo} ya se encuentra en servicio."
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
      puts "El equipo con nro. de serie: #{serie_equipo} ya se encuentra en servicio."
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

  # Reportes
  def reportes()
    begin
      system('cls')
      puts
      puts "********** Reportes **********"
      puts
      puts "1. Lista de Clientes"
      puts "2. Lista de Equipos"
      puts "3. Lista de Servicios"
      puts "4. Ganancias"
      puts "5. <- Regresar"
      puts
      puts "Seleccione una opción: "
      opcion = gets.chomp.to_i
    end until(opcion >= 1 and opcion <= 5)

    case opcion
      when 1
        listaClientes()
      when 2
        listaEquipos()
      when 3
        listaServicios()
      when 4
        ganancias()
      when 5
        menuPrincipal()
    end
  end
  
  def listaClientes()
    if @listaClientes.length > 0
      puts
      puts "********** Clientes **********"
      puts
      print "DNI".ljust(10)
      print "Nombre".ljust(15)
      print "Apellidos".ljust(20)
      print "Teléfono".ljust(10)
      print "\n"
      puts "-------------------------------------------------------"
      @listaClientes.each do |cliente|
        print "#{cliente.dni}".ljust(10)
        print "#{cliente.nombre}".ljust(15)
        print "#{cliente.apellidos}".ljust(20)
        print "#{cliente.telefono}".ljust(10)
        puts
      end
    else
      puts "No existen clientes registrados."
    end

    system('pause')
    reportes()
  end

  def listaEquipos()
    begin
      system('cls')
      puts
      puts "********** Equipos **********"
      puts
      puts "1. Lista de Computadoras"
      puts "2. Lista de Laptops"
      puts "3. Lista de Impresoras"
      puts "4. <- Regresar"
      puts
      puts "Seleccione una opción: "
      opcion = gets.chomp.to_i
    end until(opcion >= 1 and opcion <= 4)

    case opcion
      when 1
        listaComputadoras()
      when 2
        listaLaptops()
      when 3
        listaImpresoras()
      when 4
        reportes()
    end

  end

  def listaComputadoras()
    if @listaEquipos.length > 0
      puts
      puts "********** Computadoras **********"
      puts
      print "DNI cliente".ljust(15)
      print "Marca".ljust(15)
      print "Modelo".ljust(15)
      print "Serie".ljust(15)
      print "Accesorios".ljust(15)
      print "\n"
      puts "---------------------------------------------------------------------------"
      @listaEquipos.each do |equipo|
        if equipo.instance_of? Computadora
          print "#{equipo.dni_cliente}".ljust(15)
          print "#{equipo.marca}".ljust(15)
          print "#{equipo.modelo}".ljust(15)
          print "#{equipo.serie}".ljust(15)
          print "#{equipo.accesorios}".ljust(15)
          puts
        end
      end
    else
      puts "No existen equipos registrados."
    end

    system('pause')
    reportes()
  end

  def listaLaptops()
    if @listaEquipos.length > 0
      puts
      puts "********** Laptops **********"
      puts
      print "DNI cliente".ljust(15)
      print "Marca".ljust(15)
      print "Modelo".ljust(15)
      print "Serie".ljust(15)
      print "Pulgada".ljust(15)
      print "\n"
      puts "---------------------------------------------------------------------------"
      @listaEquipos.each do |equipo|
        if equipo.instance_of? Laptop
          print "#{equipo.dni_cliente}".ljust(15)
          print "#{equipo.marca}".ljust(15)
          print "#{equipo.modelo}".ljust(15)
          print "#{equipo.serie}".ljust(15)
          print "#{equipo.pulgada}".ljust(15)
          puts
        end
      end
    else
      puts "No existen equipos registrados."
    end

    system('pause')
    reportes()
  end

  def listaImpresoras()
    if @listaEquipos.length > 0
      puts
      puts "********** Laptops **********"
      puts
      print "DNI cliente".ljust(15)
      print "Marca".ljust(15)
      print "Modelo".ljust(15)
      print "Serie".ljust(15)
      print "Tipo".ljust(15)
      print "Nivel de tinta".ljust(15)
      print "\n"
      puts "------------------------------------------------------------------------------------------"
      @listaEquipos.each do |equipo|
        if equipo.instance_of? Impresora
          print "#{equipo.dni_cliente}".ljust(15)
          print "#{equipo.marca}".ljust(15)
          print "#{equipo.modelo}".ljust(15)
          print "#{equipo.serie}".ljust(15)
          print "#{equipo.tipo}".ljust(15)
          print "#{equipo.nivelTinta(equipo.nivel_tinta)}".ljust(15)
          puts
        end
      end
    else
      puts "No existen equipos registrados."
    end

    system('pause')
    reportes()
  end

  def listaServicios()
    begin
      system('cls')
      puts
      puts "********** Servicios **********"
      puts
      puts "1. Lista de servicios de Reparación"
      puts "2. Lista de servicios de Mantenimiento"
      puts "3. Lista de servicios de Instalación"
      puts "4. <- Regresar"
      puts
      puts "Seleccione una opción: "
      opcion = gets.chomp.to_i
    end until(opcion >= 1 and opcion <= 4)

    case opcion
      when 1
        listaReparacion()
      when 2
        listaMantenimiento()
      when 3
        listaInstalacion()
      when 4
        reportes()
    end
  end

  def listaReparacion()
    costoTotal = 0
    if @listaServicios.length > 0
      puts
      puts "********** Reparación **********"
      puts
      print "Código".ljust(15)
      print "DNI cliente".ljust(15)
      print "Serie".ljust(15)
      print "Fecha".ljust(20)
      print "Rep. de placa".ljust(20)
      print "Rep. de fuente".ljust(20)
      print "Costo".ljust(20)
      print "\n"
      puts "------------------------------------------------------------------------------------------------------------------------------------------------"
      @listaServicios.each do |servicio|
        if servicio.instance_of? Reparacion
          print "#{servicio.codigo}".ljust(15)
          print "#{servicio.dni_cliente}".ljust(15)
          print "#{servicio.serie_equipo}".ljust(15)
          print "#{servicio.fecha_internamiento}".ljust(20)
          print "S/ #{servicio.rep_placa}".ljust(20)
          print "S/ #{servicio.rep_fuente}".ljust(20)
          print "S/ #{servicio.costoTotal()}".ljust(20)
          costoTotal += servicio.costoTotal()
          puts
        end
      end
      puts "------------------------------------------------------------------------------------------------------------------------------------------------"
      puts "Total Servicio de Reparación: S/ #{costoTotal}"
    else
      puts "No existen servicios registrados."
    end

    system('pause')
    reportes()
  end

  def listaMantenimiento()
    costoTotal = 0
    if @listaServicios.length > 0
      puts
      puts "********** Mantenimiento **********"
      puts
      print "Código".ljust(15)
      print "DNI cliente".ljust(15)
      print "Serie".ljust(15)
      print "Fecha".ljust(20)
      print "Mant. preventivo".ljust(20)
      print "Mant. correctivo".ljust(20)
      print "Costo".ljust(20)
      print "\n"
      puts "------------------------------------------------------------------------------------------------------------------------------------------------"
      @listaServicios.each do |servicio|
        if servicio.instance_of? Mantenimiento
          print "#{servicio.codigo}".ljust(15)
          print "#{servicio.dni_cliente}".ljust(15)
          print "#{servicio.serie_equipo}".ljust(15)
          print "#{servicio.fecha_internamiento}".ljust(20)
          print "S/ #{servicio.mant_corr}".ljust(20)
          print "S/ #{servicio.mant_prev}".ljust(20)
          print "S/ #{servicio.costoTotal()}".ljust(20)
          costoTotal += servicio.costoTotal()
          puts
        end
      end
      puts "------------------------------------------------------------------------------------------------------------------------------------------------"
      puts "Total Servicio de Mantenimiento: S/ #{costoTotal}"
    else
      puts "No existen servicios registrados."
    end

    system('pause')
    reportes()
  end

  def listaInstalacion()
    costoTotal = 0
    if @listaServicios.length > 0
      puts
      puts "********** Instalación **********"
      puts
      print "Código".ljust(15)
      print "DNI cliente".ljust(15)
      print "Serie".ljust(15)
      print "Fecha".ljust(20)
      print "Inst. SO".ljust(20)
      print "Inst. programas".ljust(20)
      print "Inst. tinta".ljust(20)
      print "Costo".ljust(20)
      print "\n"
      puts "--------------------------------------------------------------------------------------------------------------------------------------------------------------------"
      @listaServicios.each do |servicio|
        if servicio.instance_of? Mantenimiento
          print "#{servicio.codigo}".ljust(15)
          print "#{servicio.dni_cliente}".ljust(15)
          print "#{servicio.serie_equipo}".ljust(15)
          print "#{servicio.fecha_internamiento}".ljust(20)
          print "S/ #{inst_so}".ljust(20)
          print "S/ #{inst_prog}".ljust(20)
          print "S/ #{inst_tinta}".ljust(20)
          print "S/ #{servicio.costoTotal()}".ljust(20)
          costoTotal += servicio.costoTotal()
          puts
        end
      end
      puts "--------------------------------------------------------------------------------------------------------------------------------------------------------------------"
      puts "Total Servicio de Instalación: S/ #{costoTotal}"
    else
      puts "No existen equipos registrados."
    end

    system('pause')
    reportes()
  end

  def ganancias()
    costoTotalReparación = 0
    costoTotalMantenimiento = 0
    costoTotalInstalación = 0
    if @listaServicios.length > 0
      puts
      puts "********** Resumen de Ganancias **********"
      puts
      print "Servicio".ljust(20)
      print "Ganancia".ljust(20)
      puts
      puts "-------------------------------------------------------"
      @listaServicios.each do |servicio|
        if servicio.instance_of? Reparacion
          costoTotalReparación += servicio.costoTotal()
        end

        if servicio.instance_of? Mantenimiento
          costoTotalMantenimiento += servicio.costoTotal()
        end

        if servicio.instance_of? Instalacion
          costoTotalInstalación += servicio.costoTotal()
        end
      end
      print "Reparación".ljust(20)
      print "S/ #{costoTotalReparación}".ljust(20)
      puts
      print "Mantenimiento".ljust(20)
      print "S/ #{costoTotalMantenimiento}".ljust(20)
      puts
      print "Instalación".ljust(20)
      print "S/ #{costoTotalInstalación}".ljust(20)
      puts
      puts "-------------------------------------------------------"
      gananciaTotal = costoTotalReparación + costoTotalMantenimiento + costoTotalInstalación
      puts "Ganancias totales de Servicios: S/ #{gananciaTotal}"
    else
      puts "No existen servicios registrados."
    end

    system('pause')
    reportes()
  end

end

sis = Sistema.new()
sis.menuPrincipal()