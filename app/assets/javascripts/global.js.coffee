jQuery ->
  $('#multiselect-matches').multiSelect
    selectableHeader: "<div class='multiselect-header'>Partidos</div>"
    selectionHeader: "<div class='multiselect-header'>Partidos en Quiniela</div>"
  $('#multiselect-e-matches').multiSelect
    selectableHeader: "<div class='multiselect-header'>Partidos de Eliminacion</div>"
    selectionHeader: "<div class='multiselect-header'>Partidos en Quiniela</div>"
  $('.chosen-select').chosen()
  $('.timepicker').ptTimeSelect()
  $('.datepicker').Zebra_DatePicker
    days: ['Domingo', 'Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sabado']
    months: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto',
      'Septiembre', 'Octubre', 'Noviembre', 'Diciembre']
    lang_clear_date: "Limpiar"
    show_select_today: false
    # direction: ['2014-06-12','2014-07-13']