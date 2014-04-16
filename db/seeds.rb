# Admin
User.create(name: "Admin", email: "admin@app.com", password: "12345678",
  password_confirmation: "12345678", role: "admin")

#Groups
('A'..'H').each do |l|
  Group.create(name: "Equipo #{l}")
end

#teams
Team.create(name: "Argentina"      ,    abbr: "ARG", group_id: 6, pos: 1)
Team.create(name: "Australia"      ,    abbr: "AUS", group_id: 2, pos: 4)
Team.create(name: "Brasil"         ,    abbr: "BRA", group_id: 1, pos: 1)
Team.create(name: "Corea del Sur"  ,    abbr: "KRO", group_id: 8, pos: 4)
Team.create(name: "Costa Rica"     ,    abbr: "CRC", group_id: 4, pos: 2)
Team.create(name: "Estados Unidos" ,    abbr: "USA", group_id: 7, pos: 4)
Team.create(name: "Irán"           ,    abbr: "IRN", group_id: 6, pos: 3)
Team.create(name: "Italia"         ,    abbr: "ITA", group_id: 4, pos: 4)
Team.create(name: "Japón"          ,    abbr: "JPN", group_id: 3, pos: 4)
Team.create(name: "Holanda"        ,    abbr: "NED", group_id: 2, pos: 2)
Team.create(name: "Alemania"       ,    abbr: "GER", group_id: 7, pos: 1)
Team.create(name: "Bélgica"        ,    abbr: "BEL", group_id: 8, pos: 1)
Team.create(name: "Colombia"       ,    abbr: "COL", group_id: 3, pos: 1)
Team.create(name: "Suiza"          ,    abbr: "SUI", group_id: 5, pos: 1)
Team.create(name: "Rusia"          ,    abbr: "RUS", group_id: 8, pos: 3)
Team.create(name: "Bosnia"         ,    abbr: "BIH", group_id: 6, pos: 2)
Team.create(name: "Inglaterra"     ,    abbr: "ENG", group_id: 4, pos: 3)
Team.create(name: "España"         ,    abbr: "ESP", group_id: 2, pos: 1)
Team.create(name: "Chile"          ,    abbr: "CHI", group_id: 2, pos: 3)
Team.create(name: "Ecuador"        ,    abbr: "ECU", group_id: 5, pos: 2)
Team.create(name: "Honduras"       ,    abbr: "HON", group_id: 5, pos: 4)
Team.create(name: "Camerún"        ,    abbr: "CMR", group_id: 1, pos: 4)
Team.create(name: "Costa de Marfil",    abbr: "CIV", group_id: 3, pos: 3)
Team.create(name: "Nigeria"        ,    abbr: "NGA", group_id: 6, pos: 4)
Team.create(name: "Ghana"          ,    abbr: "GHA", group_id: 7, pos: 3)
Team.create(name: "Argelia"        ,    abbr: "ALG", group_id: 8, pos: 2)
Team.create(name: "Portugal"       ,    abbr: "POR", group_id: 7, pos: 2)
Team.create(name: "Francia"        ,    abbr: "FRA", group_id: 5, pos: 3)
Team.create(name: "Croacia"        ,    abbr: "CRO", group_id: 1, pos: 2)
Team.create(name: "Grecia"         ,    abbr: "GRE", group_id: 3, pos: 2)
Team.create(name: "México"         ,    abbr: "MEX", group_id: 1, pos: 3)
Team.create(name: "Uruguay"        ,    abbr: "URU", group_id: 4, pos: 1)