# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Video.destroy_all
Comment.destroy_all

video1 = Video.create(subject:"George Lopez", link_url:"https://www.youtube.com/embed/iPAjcdrbW3c", author:"Anand", date_created:"August 01, 2015", likes:12)

video2 = Video.create(subject:"Jerry Seinfeld", link_url:"https://www.youtube.com/embed/NS2waCMeokE", author:"AnandM", date_created:"August 02, 2015", likes:21)

video3 = Video.create(subject:"Russell Peters", link_url:"https://www.youtube.com/embed/L2JcsFObmJc", author:"AnandM", date_created:"August 03, 2015", likes:270)

video4 = Video.create(subject:"Larry the Cable Guy", link_url:"https://www.youtube.com/embed/dc-a13Rfgak", author:"AnandM", date_created:"August 04, 2015", likes:45)

video5 = Video.create(subject:"Jeff Dunham", link_url:"https://www.youtube.com/embed/M-lTNx1xFqI", author:"AnandM", date_created:"August 05, 2015", likes:67)

video6 = Video.create(subject:"Aziz Ansari", link_url:"https://www.youtube.com/embed/dNiQyM9hasY", author:"AnandM", date_created:"August 03, 2015", likes:270)

video7 = Video.create(subject:"Chris Tucker", link_url:"https://www.youtube.com/embed/KV0Iv---Z4o", author:"AnandM", date_created:"August 04, 2015", likes:45)

video8 = Video.create(subject:"Louis ck", link_url:"https://www.youtube.com/embed/2sIhvXV32gQ", author:"AnandM", date_created:"August 05, 2015", likes:67)
video9 = Video.create(subject:"Jim Gaffigan", link_url:"https://www.youtube.com/embed/vWZ3LLILccY", author:"AnandM", date_created:"August 05, 2015", likes:67)
comment1 = Comment.create(text_body:"Video 1 looks good, yay!", author:"Mr.Utube", date_created:"2015", video:video1 )

# Excellent seeds!!!
