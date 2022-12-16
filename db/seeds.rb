require 'nokogiri'
require 'open-uri'



def links_from_bkp
  links = %w(https://en.wikipedia.org/wiki/2011_T%C5%8Dhoku_earthquake_and_tsunami
  https://en.wikipedia.org/wiki/Wiki
  https://en.wikipedia.org/wiki/Pok%C3%A9mon_Go
  https://en.wikipedia.org/wiki/The_Girl_with_the_Dragon_Tattoo
  https://en.wikipedia.org/wiki/Layla
  https://en.wikipedia.org/wiki/Charles_III
  https://en.wikipedia.org/wiki/Breaking_Bad
  https://en.wikipedia.org/wiki/India
  https://en.wikipedia.org/wiki/Pantheon,_Rome
  https://en.wikipedia.org/wiki/Metal_Gear_Solid_V:_The_Phantom_Pain
  https://en.wikipedia.org/wiki/My_Beautiful_Dark_Twisted_Fantasy
  https://en.wikipedia.org/wiki/World_of_Warcraft
  https://en.wikipedia.org/wiki/Yeezus
  https://en.wikipedia.org/wiki/Rosetta_Stone
  https://en.wikipedia.org/wiki/Godzilla
  https://en.wikipedia.org/wiki/Brad_Pitt
  https://en.wikipedia.org/wiki/Borussia_Dortmund
  https://en.wikipedia.org/wiki/Lil_Wayne
  https://en.wikipedia.org/wiki/The_Walking_Dead_(TV_series)
  https://en.wikipedia.org/wiki/Depression_(mood)
  https://en.wikipedia.org/wiki/Let_It_Be_(Beatles_album)
  https://en.wikipedia.org/wiki/Cum_shot
  https://en.wikipedia.org/wiki/Non-penetrative_sex
  https://en.wikipedia.org/wiki/The_48_Laws_of_Power
  https://en.wikipedia.org/wiki/We_Are_the_World
  https://en.wikipedia.org/wiki/Cristiano_Ronaldo
  https://en.wikipedia.org/wiki/Venus
  https://en.wikipedia.org/wiki/Katy_Perry
  https://en.wikipedia.org/wiki/Coronavirus
  https://en.wikipedia.org/wiki/Mumbai
  https://en.wikipedia.org/wiki/Frankenstein
  https://en.wikipedia.org/wiki/Turmeric
  https://en.wikipedia.org/wiki/Umayyad_Caliphate
  https://en.wikipedia.org/wiki/One_Thousand_and_One_Nights
  https://en.wikipedia.org/wiki/Tower_of_London
  https://en.wikipedia.org/wiki/Leonardo_DiCaprio
  https://en.wikipedia.org/wiki/Republic_of_Ireland
  https://en.wikipedia.org/wiki/Earthquake
  https://en.wikipedia.org/wiki/Rihanna
  https://en.wikipedia.org/wiki/Alcatraz_Federal_Penitentiary
  https://en.wikipedia.org/wiki/Maratha_Empire
  https://en.wikipedia.org/wiki/Lust
  https://en.wikipedia.org/wiki/Britney_Spears
  https://en.wikipedia.org/wiki/Krishna
  https://en.wikipedia.org/wiki/Sign_of_the_horns
  https://en.wikipedia.org/wiki/Big_Bang
  https://en.wikipedia.org/wiki/Nazi_salute
  https://en.wikipedia.org/wiki/Syrian_civil_war
  https://en.wikipedia.org/wiki/Lion
  https://en.wikipedia.org/wiki/Apple
  https://en.wikipedia.org/wiki/Tori_Black
  https://en.wikipedia.org/wiki/Henry_V_of_England
  https://en.wikipedia.org/wiki/Charles_III
  https://en.wikipedia.org/wiki/Tribadism
  https://en.wikipedia.org/wiki/Minecraft
  https://en.wikipedia.org/wiki/New_York_City
  https://en.wikipedia.org/wiki/John_Cena
  https://en.wikipedia.org/wiki/Grand_Theft_Auto_V
  https://en.wikipedia.org/wiki/Dark_matter
  https://en.wikipedia.org/wiki/Michael_Jackson
  https://en.wikipedia.org/wiki/Wikipedia:Contact_us
  https://en.wikipedia.org/wiki/September_11_attacks
  https://en.wikipedia.org/wiki/Chelsea_F.C.
  https://en.wikipedia.org/wiki/Singapore
  https://en.wikipedia.org/wiki/Octopus
  https://en.wikipedia.org/wiki/Neymar
  https://en.wikipedia.org/wiki/Ramayana
  https://en.wikipedia.org/wiki/Gupta_Empire
  https://en.wikipedia.org/wiki/Volcano
  https://en.wikipedia.org/wiki/Syrian_civil_war
  https://en.wikipedia.org/wiki/Good_Kid,_M.A.A.D_City
  https://en.wikipedia.org/wiki/Code_Geass
  https://en.wikipedia.org/wiki/Prometheus
  https://en.wikipedia.org/wiki/Attack_on_Pearl_Harbor
  https://en.wikipedia.org/wiki/List_of_best-selling_music_artists
  https://en.wikipedia.org/wiki/The_Simpsons
  https://en.wikipedia.org/wiki/Freddie_Mercury
  https://en.wikipedia.org/wiki/Ragnar_Lodbrok
  https://en.wikipedia.org/wiki/Italy_national_football_team
  https://en.wikipedia.org/wiki/Oral_sex
  https://en.wikipedia.org/wiki/Kim_Kardashian
  https://en.wikipedia.org/wiki/Priyanka_Chopra
  https://en.wikipedia.org/wiki/Sunny_Leone
  https://en.wikipedia.org/wiki/Game_of_Thrones
  https://en.wikipedia.org/wiki/Ron_Jeremy
  https://en.wikipedia.org/wiki/List_of_Game_of_Thrones_episodes
  https://en.wikipedia.org/wiki/Adele
  https://en.wikipedia.org/wiki/List_of_pornographic_actresses_by_decade
  https://en.wikipedia.org/wiki/Cthulhu
  https://en.wikipedia.org/wiki/Bukkake
  https://en.wikipedia.org/wiki/Lunar_eclipse
  https://en.wikipedia.org/wiki/Erling_Haaland
  https://en.wikipedia.org/wiki/Harry_Potter_and_the_Deathly_Hallows
  https://en.wikipedia.org/wiki/House_(TV_series)
  https://en.wikipedia.org/wiki/Woman_on_top
  https://en.wikipedia.org/wiki/Katy_Perry
  https://en.wikipedia.org/wiki/Taylor_Swift
  https://en.wikipedia.org/wiki/Conor_McGregor
  https://en.wikipedia.org/wiki/Missionary_position
  https://en.wikipedia.org/wiki/Asa_Akira
  https://en.wikipedia.org/wiki/How_I_Met_Your_Mother
  https://en.wikipedia.org/wiki/Tiger
  https://en.wikipedia.org/wiki/John_Lennon
  https://en.wikipedia.org/wiki/A.C._Milan
  https://en.wikipedia.org/wiki/Abbey_Road
  https://en.wikipedia.org/wiki/Jack_the_Ripper
  https://en.wikipedia.org/wiki/Germany_national_football_team
  https://en.wikipedia.org/wiki/Spider-Man
  https://en.wikipedia.org/wiki/Berlin
  https://en.wikipedia.org/wiki/Nudity)
end

def parse_links_from_wikipedia
  puts "[START] PARSING WIKIPEDIA POPULAR PAGES"
  base_wikipedia = 'https://en.wikipedia.org'
  html = URI.open("https://en.wikipedia.org/wiki/Wikipedia:Popular_pages")
  doc = Nokogiri::HTML(html)

  links = doc.css('.wikitable tr td:nth-child(2) a').map do |link| 
    link.attribute("href").value
  end

  links = links.select{|link| link.to_s.start_with?("/wiki/")}.map { |link| "#{base_wikipedia}#{link}" }[0...110]
end

links = parse_links_from_wikipedia
puts "[FINISHED] PARSE FINISHED...\n\n"
sleep 0.5
puts "[START] INSERTING ON DATABASE"
links.each do |link|
  Url.create(original: link, total_access: rand(1..100))
end
puts "[FINISHED] INSERTIONS FINISHED\n\n"
puts "REMEMBER!! \nExecute 'bundle exec sidekiq' in another terminal to parse url title\n\n\n"