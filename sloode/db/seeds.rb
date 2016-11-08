# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

schools = School.create([
                          { name: 'João XXIII', email: 'atendimento@joaoxxiii.com.br', pitch: 'aaa', subdomain: 'joaoxxiii', creation_date: '2016-11-03' },
                          { name: 'Santa Catarina', email: 'atendimento@santacatarina.com.br', pitch: 'bbb', subdomain: 'santa-catarina', creation_date: '2016-11-03' },
                          { name: 'Jesuítas', email: 'atendimento@jesuitas.com.br', pitch: 'ccc', subdomain: 'jesuitas', creation_date: '2016-11-03' }
                        ])

Course.create([
                { title: 'Matemática', school_id: schools[0].id, duration: 180, active_students: 15 },
                { title: 'Português', school_id: schools[0].id, duration: 180, active_students: 7 },
                { title: 'Física', school_id: schools[0].id, duration: 180, active_students: 3 },
                { title: 'Física', school_id: schools[1].id, duration: 180, active_students: 6 },
                { title: 'Inglês', school_id: schools[1].id, duration: 180, active_students: 20 },
                { title: 'Português', school_id: schools[2].id, duration: 180, active_students: 16 }
              ])
