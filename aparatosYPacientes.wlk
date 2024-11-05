class Paciente {
  var edad
  var fortalezaMuscular
  var dolor
  var rutina = []

  method edad() = edad
  method fortalezaMuscular() = fortalezaMuscular
  method dolor() = dolor
  method cumplirAnios(){edad += 1}
  method cargarRutina(unaLista) {
    rutina.clear()
    rutina.addAll(unaLista)
  }

  method disminuirDolor(unValor) {
    dolor = 0.max(dolor - unValor)
  }
  method aumentarFortaleza(unValor) {
    fortalezaMuscular -= unValor
  }

  method puedeUsar(unAparato) = unAparato.puedeSerUsadoPor(self)

  method usar(unAparato) {
    if(self.puedeUsar(unAparato)){
      unAparato.consecuenciasDeUso(self)}
  }

  method puedeHacerRutina() = rutina.all{a => self.puedeUsar(a)}

  method realizarRutina() {
    rutina.forEach{a => self.usar(a)}
  }
}

class Resistente inherits Paciente {
  override method realizarRutina() {
    const cantidad = rutina.count{a => self.puedeUsar(a)}
    super()
    self.aumentarFortaleza(cantidad)
  }
}

class Caprichoso inherits Paciente {
  override method puedeHacerRutina(){ 
    return self.hayAlgunAparatoRojo() and super()
  }
  method hayAlgunAparatoRojo() = rutina.any{a => a.color() == "rojo"}

  override method realizarRutina() {
    super()//!!!
    super()
  }
}

class RapidaRecuperacion inherits Paciente {
   override method realizarRutina(){
    super()
    self.disminuirDolor(disminucionDolor.valor())
   }
}

object disminucionDolor {//!!!!!!
  var property valor = 3
}

class Aparato {
  var property color = "blanco"
  method consecuenciasDeUso(unPaciente)
  method puedeSerUsadoPor(unPaciente) 
}

class Magneto inherits Aparato {
  override method consecuenciasDeUso(unPaciente){
    unPaciente.disminuirDolor(unPaciente.dolor() * 0.1)
  }
  override method puedeSerUsadoPor(unPaciente) = true
}
class Bici inherits Aparato {
  override method consecuenciasDeUso(unPaciente){
    unPaciente.disminuirDolor(4)
    unPaciente.aumentarFortaleza(3)
  }
  override method puedeSerUsadoPor(unPaciente) = unPaciente.edad() > 8
}
class Minitramp inherits Aparato {
  override method consecuenciasDeUso(unPaciente){
    unPaciente.disminuirDolor(4)
    unPaciente.aumentarFortaleza(Paciente.edad() * 0.1)
  }
  override method puedeSerUsadoPor(unPaciente) = unPaciente.dolor() < 20
}

