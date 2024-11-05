object centro {
  const pacientes = []
  const aparatos = []

  method agregarPaciente(unaLista) {
    pacientes.addAll(unaLista)
  }
  method agregarAparatos(unaLista) {
    aparatos.addAll(unaLista)
  }

  method coloresDeLosAparatos() {
    return aparatos.map({a => a.color()}).asSet()//eliminaRep
  }
  method pacientesMenoresDe(unValor) {
    return pacientes.filter{p => p.edad() < unValor}
  }
  method pacientesQueNoPuedenCumplirRutina() {
    pacientes.count{p => !p.puedeHacerRutina()}
  }
}