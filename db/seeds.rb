# Admin
User.create(name: "Admin", email: "admin@app.com", password: "12345678",
  password_confirmation: "12345678", role: "admin", last_name: "Application")

#Groups
('A'..'H').each do |l|
  Group.create(name: "Grupo #{l}")
end

#teams
Team.create(name: "Rusia", abbr: "RUS", group_id: 1, pos: 1)
Team.create(name: "Arabia Saudí", abbr: "SAU", group_id: 1, pos: 2)
Team.create(name: "Egipto", abbr: "EGY", group_id: 1, pos: 3)
Team.create(name: "Uruguay", abbr: "URU", group_id: 1, pos: 4)
Team.create(name: "Portugal", abbr: "POR", group_id: 2, pos: 1)
Team.create(name: "España", abbr: "ESP", group_id: 2, pos: 2)
Team.create(name: "Marruecos", abbr: "MAR", group_id: 2, pos: 3)
Team.create(name: "Irán", abbr: "IRN", group_id: 2, pos: 4)
Team.create(name: "Francia", abbr: "FRA", group_id: 3, pos: 1)
Team.create(name: "Australia", abbr: "AUS", group_id: 3, pos: 2)
Team.create(name: "Perú", abbr: "PER", group_id: 3, pos: 3)
Team.create(name: "Dinamarca", abbr: "DNK", group_id: 3, pos: 4)
Team.create(name: "Argentina", abbr: "ARG", group_id: 4, pos: 1)
Team.create(name: "Islandia", abbr: "ISL", group_id: 4, pos: 2)
Team.create(name: "Croacia", abbr: "CRO", group_id: 4, pos: 3)
Team.create(name: "Nigeria", abbr: "NIG", group_id: 4, pos: 4)
Team.create(name: "Brasil", abbr: "BRA", group_id: 5, pos: 1)
Team.create(name: "Suiza", abbr: "SUI", group_id: 5, pos: 2)
Team.create(name: "Costa Rica", abbr: "CRI", group_id: 5, pos: 3)
Team.create(name: "Serbia", abbr: "SRB", group_id: 5, pos: 4)
Team.create(name: "Alemania", abbr: "ALE", group_id: 6, pos: 1)
Team.create(name: "México", abbr: "MEX", group_id: 6, pos: 2)
Team.create(name: "Suecia", abbr: "SUE", group_id: 6, pos: 3)
Team.create(name: "Corea del Sur", abbr: "KOR", group_id: 6, pos: 4)
Team.create(name: "Bélgica", abbr: "BEL", group_id: 7, pos: 1)
Team.create(name: "Panamá", abbr: "PAN", group_id: 7, pos: 2)
Team.create(name: "Túnez", abbr: "TUN", group_id: 7, pos: 3)
Team.create(name: "Inglaterra", abbr: "ING", group_id: 7, pos: 4)
Team.create(name: "Polonia", abbr: "POL", group_id: 8, pos: 1)
Team.create(name: "Senegal", abbr: "SEN", group_id: 8, pos: 2)
Team.create(name: "Colombia", abbr: "COL", group_id: 8, pos: 3)
Team.create(name: "Japón", abbr: "JPN", group_id: 8, pos: 4)



# # Matches
# Match.create!(date: '2014-06-12', hour: '15:30', stadium: "Sao Paulo", group_id: 1,
#   match_number: 1, local_team_id: 3, visitor_team_id: 29 )
# Match.create!(date: '2014-06-13', hour: '11:30', stadium: "Natal", group_id: 1,
#   match_number: 2, local_team_id: 31, visitor_team_id: 22 )
# Match.create!(date: '2014-06-13', hour: '14:30', stadium: "Salvador", group_id: 2,
#   match_number: 3, local_team_id: 18, visitor_team_id: 10 )
# Match.create!(date: '2014-06-13', hour: '17:30', stadium: "Cuiaba", group_id: 2,
#   match_number: 4, local_team_id: 19, visitor_team_id: 2 )
# Match.create!(date: '2014-06-14', hour: '11:30', stadium: "Belo Horizonte", group_id: 3,
#   match_number: 5, local_team_id: 13, visitor_team_id: 30 )
# Match.create!(date: '2014-06-14', hour: '14:30', stadium: "Fortaleza", group_id: 4,
#   match_number: 6, local_team_id: 32, visitor_team_id: 5 )
# Match.create!(date: '2014-06-14', hour: '17:30', stadium: "Manaos", group_id: 4,
#   match_number: 7, local_team_id: 17, visitor_team_id: 8 )
# Match.create!(date: '2014-06-14', hour: '20:30', stadium: "Recife", group_id: 3,
#   match_number: 8, local_team_id: 23, visitor_team_id: 9 )
# Match.create!(date: '2014-06-15', hour: '11:30', stadium: "Brasilia", group_id: 5,
#   match_number: 9, local_team_id: 14, visitor_team_id: 20 )
# Match.create!(date: '2014-06-15', hour: '14:30', stadium: "Porto Alegre", group_id: 5,
#   match_number: 10, local_team_id: 28, visitor_team_id: 21 )
# Match.create!(date: '2014-06-15', hour: '17:30', stadium: "Rio de Janeiro", group_id: 6,
#   match_number: 11, local_team_id: 1, visitor_team_id: 16 )
# Match.create!(date: '2014-06-16', hour: '11:30', stadium: "Salvador", group_id: 7,
#   match_number: 12, local_team_id: 11, visitor_team_id: 27 )
# Match.create!(date: '2014-06-16', hour: '14:30', stadium: "Curitiba", group_id: 6,
#   match_number: 13, local_team_id: 7, visitor_team_id: 24 )
# Match.create!(date: '2014-06-16', hour: '17:30', stadium: "Natal", group_id: 7,
#   match_number: 14, local_team_id: 25, visitor_team_id: 6 )
# Match.create!(date: '2014-06-17', hour: '11:30', stadium: "Belo Horizonte", group_id: 8,
#   match_number: 15, local_team_id: 12, visitor_team_id: 26 )
# Match.create!(date: '2014-06-17', hour: '17:30', stadium: "Cuiaba", group_id: 8,
#   match_number: 16, local_team_id: 15, visitor_team_id: 4 )
# Match.create!(date: '2014-06-17', hour: '14:30', stadium: "Fortaleza", group_id: 1,
#   match_number: 17, local_team_id: 3, visitor_team_id: 31 )
# Match.create!(date: '2014-06-18', hour: '17:30', stadium: "Manaos", group_id: 1,
#   match_number: 18, local_team_id: 22, visitor_team_id: 29 )
# Match.create!(date: '2014-06-18', hour: '14:30', stadium: "Rio de Janeiro", group_id: 2,
#   match_number: 19, local_team_id: 18, visitor_team_id: 19 )
# Match.create!(date: '2014-06-18', hour: '11:30', stadium: "Porto Alegre", group_id: 2,
#   match_number: 20, local_team_id: 2, visitor_team_id: 10 )
# Match.create!(date: '2014-06-19', hour: '11:30', stadium: "Brasilia", group_id: 3,
#   match_number: 21, local_team_id: 13, visitor_team_id: 23 )
# Match.create!(date: '2014-06-19', hour: '17:30', stadium: "Natal", group_id: 3,
#   match_number: 22, local_team_id: 9, visitor_team_id: 30 )
# Match.create!(date: '2014-06-19', hour: '14:30', stadium: "Sao Paulo", group_id: 4,
#   match_number: 23, local_team_id: 32, visitor_team_id: 17 )
# Match.create!(date: '2014-06-20', hour: '11:30', stadium: "Recife", group_id: 4,
#   match_number: 24, local_team_id: 8, visitor_team_id: 5 )
# Match.create!(date: '2014-06-20', hour: '14:30', stadium: "Salvador", group_id: 5,
#   match_number: 25, local_team_id: 14, visitor_team_id: 28 )
# Match.create!(date: '2014-06-20', hour: '17:30', stadium: "Curitiba", group_id: 5,
#   match_number: 26, local_team_id: 21, visitor_team_id: 20 )
# Match.create!(date: '2014-06-21', hour: '11:30', stadium: "Belo Horizonte", group_id: 6,
#   match_number: 27, local_team_id: 1, visitor_team_id: 7 )
# Match.create!(date: '2014-06-21', hour: '17:30', stadium: "Cuiaba", group_id: 6,
#   match_number: 28, local_team_id: 24, visitor_team_id: 16 )
# Match.create!(date: '2014-06-21', hour: '14:30', stadium: "Fortaleza", group_id: 7,
#   match_number: 29, local_team_id: 11, visitor_team_id: 25 )
# Match.create!(date: '2014-06-22', hour: '17:30', stadium: "Manaos", group_id: 7,
#   match_number: 30, local_team_id: 6, visitor_team_id: 27 )
# Match.create!(date: '2014-06-22', hour: '11:30', stadium: "Rio de Janeiro", group_id: 8,
#   match_number: 31, local_team_id: 12, visitor_team_id: 15 )
# Match.create!(date: '2014-06-22', hour: '14:30', stadium: "Porto Alegre", group_id: 8,
#   match_number: 32, local_team_id: 4, visitor_team_id: 26 )
# Match.create!(date: '2014-06-23', hour: '15:30', stadium: "Brasilia", group_id: 1,
#   match_number: 33, local_team_id: 22, visitor_team_id: 3 )
# Match.create!(date: '2014-06-23', hour: '15:30', stadium: "Recife", group_id: 1,
#   match_number: 34, local_team_id: 29, visitor_team_id: 31 )
# Match.create!(date: '2014-06-23', hour: '11:30', stadium: "Curitiba", group_id: 2,
#   match_number: 35, local_team_id: 2, visitor_team_id: 18 )
# Match.create!(date: '2014-06-23', hour: '11:30', stadium: "Sao Paulo", group_id: 2,
#   match_number: 36, local_team_id: 10, visitor_team_id: 19 )
# Match.create!(date: '2014-06-24', hour: '15:30', stadium: "Cuiaba", group_id: 3,
#   match_number: 37, local_team_id: 9, visitor_team_id: 13 )
# Match.create!(date: '2014-06-24', hour: '15:30', stadium: "Fortaleza", group_id: 3,
#   match_number: 38, local_team_id: 30, visitor_team_id: 23 )
# Match.create!(date: '2014-06-24', hour: '11:30', stadium: "Natal", group_id: 4,
#   match_number: 39, local_team_id: 8, visitor_team_id: 32 )
# Match.create!(date: '2014-06-24', hour: '11:30', stadium: "Belo Horizonte", group_id: 4,
#   match_number: 40, local_team_id: 5, visitor_team_id: 17 )
# Match.create!(date: '2014-06-25', hour: '15:30', stadium: "Manaos", group_id: 5,
#   match_number: 41, local_team_id: 21, visitor_team_id: 14 )
# Match.create!(date: '2014-06-25', hour: '15:30', stadium: "Rio de Janeiro", group_id: 5,
#   match_number: 42, local_team_id: 20, visitor_team_id: 28 )
# Match.create!(date: '2014-06-25', hour: '11:30', stadium: "Porto Alegre", group_id: 6,
#   match_number: 43, local_team_id: 24, visitor_team_id: 1 )
# Match.create!(date: '2014-06-25', hour: '11:30', stadium: "Salvador", group_id: 6,
#   match_number: 44, local_team_id: 16, visitor_team_id: 7 )
# Match.create!(date: '2014-06-26', hour: '11:30', stadium: "Recife", group_id: 7,
#   match_number: 45, local_team_id: 6, visitor_team_id: 11 )
# Match.create!(date: '2014-06-26', hour: '11:30', stadium: "Brasilia", group_id: 7,
#   match_number: 46, local_team_id: 27, visitor_team_id: 25 )
# Match.create!(date: '2014-06-26', hour: '15:30', stadium: "Sao Paulo", group_id: 8,
#   match_number: 47, local_team_id: 4, visitor_team_id: 12 )
# Match.create!(date: '2014-06-26', hour: '15:30', stadium: "Curitiba", group_id: 8,
#   match_number: 48, local_team_id: 26, visitor_team_id: 15 )