jQuery ->
  date_from_string = (str)->
    DateParts = str.split('-')
    year = parseInt(DateParts[2])
    month = parseInt(DateParts[1]) - 1
    day = parseInt(DateParts[0])
    new Date(year, month, day)

  $('#matches-table').stupidtable
    "date": (a, b)->
      aDate = date_from_string(a)
      bDate = date_from_string(b)
      aDate - bDate
  $('#bets-table').stupidtable()
  $('.sorted th a').on 'click', (event)->
    event.preventDefault()
