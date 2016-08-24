# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

technologyType = TechnologyType.create([{code: 'Satellite', description: 'Satellite'},
                                        {code: 'FTTB-Cooper', description: 'FTTB-Cooper'},
                                        {code: 'HFC', description: 'HFC'},
                                        {code: 'Greenfields Fibre', description: 'Greenfields Fibre'},
                                        {code: 'Browfields Fibre', description: 'Browfields Fibre'},
                                        {code: 'Wireless', description: 'Wireless'},
                                        {code: 'FTTN-Cooper', description: 'FTTN-Cooper'}])