puts "Destroying all clubs..."

Club.destroy_all

puts "Creating the clubs..."

club_attributes = [
  {
    name: "THE PEARL"
  },
  {
    name: "Insomnia"
  },
  {
    name: "Berghain"
  },
  {
    name: "Cassiopeia"
  },
  {
    name: "Astra Kulturhaus"
  },
  {
    name: "AVA Club"
  },
  {
    name: "Matrix"
  },
  {
    name: "Sage club"
  },
  {
    name: "PURO Sky Lounge"
  },
  {
    name: "Kit Kat"
  },
  {
    name: "Alte Kantine"
  },
  {
    name: "Frannz Club"
  },
  {
    name: "Pirates Berlin"
  }
]

club_attributes.each do |club_attribute|
  Club.create!(club_attribute)
end

puts "Created clubs"

puts "Destroying all events..."

Event.destroy_all

puts "Creating events..."

event_attributes = [
  {
    name: "URBAN ZOO",
    date: 20190614,
    description: "Der Urban Zoo trommelt diese Woche wieder die wildesten Partylöwen der Stadt zusammen und verwöhnt euch mit Berlins wiiiiildest Hip Hop. Die hungrigsten Tiger, die schönsten Raubkätzchen und die verrückteste Partycrew gibt es nur hier und wir wissen wie man feiert!",
    link: 'https://www.virtualnights.com/berlin/event/urban-zoo.4220453',
    club_name: "THE PEARL",
    tag_list: ['house', 'classic']
  },
  {
    name: "LOVE THE 80'S - POP & WAVE PARTY",
    date: 20190614,
    description: "Rocker, Schocker, Punks & Popper - schrill, bunt & sexy
    Wir feiern die 80er Jahre, das verückteste Jahrzehnt!
    Ob Nena, Boy George, Teresa Orlowski oder Falco, Billy Idol & Pierre Cosso - die Mädchen waren heiß und die Boys waren wild.
    Andere wurden zu unsterblichen Königen des Pop wie Michael Jackson oder unerreichbaren Stilikonen wie Madonna.",
    link: 'https://www.virtualnights.com/berlin/event/love-the-80s-pop-wave-party.4239838',
    club_name: "THE PEARL",
    tag_list: ['classic']
  },
  {
    name: "ZEHN JAHRE MONKEYTOWN RECORDS",
    date: 20190614,
    description: "Berghain
    Catnapp | Dark Sky | Fadi Mohem | MDSLKTR b2b Skream!
    Panorama Bar
    Anz | Dance System | Kasper Marott | MDSLKTR b2b Gajek | Siriusmo",
    link: 'https://www.virtualnights.com/berlin/event/zehn-jahre-monkeytown-records.4248441',
    club_name: "THE PEARL",
    tag_list: ['techno', 'pop']
  },
  {
    name: "DIRTYDANCINGPARTY",
    date: 20190614,
    description: "Dirty Dancing Party - SummerSpecial 2o19
    3 Floors & Summergarden - 80s & 90s Love
    Cassiopeia Club - Cassiopeia Club
    Berlin`s schönste 80er & 90er Party
    Lasst uns tanzen!
    - pop/rock/alltime classics floor
    - golden age - hip hop & rnb floor
    - alternative/kuschelrock floor
    - summergarden: disko/boogie/funk music
    Die wahren Hüter der 999 Luftballons sind zurück!
    Tanzschuhe nicht vergessen.
    Dresscode: Fresh & Good Vibes
    Berlins schönste 80er & 90er Party
    Cassiopeia Sommer Special 2019
    Bad Taste kann jeder, Dirty Dancing hat Bock auf Good Taste und das die ganze Nacht.
    Wir entführen Euch in die Zeit von Lasershows und Nebelschwaden, als noch Pop Titanen und keine One Hit Wonder geschmiedet wurden. Rock, Pop, Disko, Hip Hop, RnB und Synthie Klassiker erwarten Euch. Lederjacke, Neonshirt, Goldkette und Fönfrisur sind bei uns immer willkommen! Wir haben wieder für euch ein Top DJ Team, für diese großartige Partynacht gezaubert.",
    link: 'https://www.virtualnights.com/berlin/event/dirtydancingparty.4241830',
    club_name: "THE PEARL",
    tag_list: ['hip-hop']
  },
  {
    name: "ASTRA! ASTRA! PARTY! HITS!",
    date: 20190615,
    description: "Wennschon, dennschon ist der Leitspruch, der seit der Geburtsstunde des Feierns besteht. Während unsere Vorfahren, ihren Bass noch aus Baumstämmen prügeln mussten, haben wir heute die Hände frei für Getränke, den ausgestreckten Partyzeigefinger, oder zum Verteilen von High Fives an Freunde und Fremde, wenn die Hits auf uns prasseln, wie ein warmer, angenehmer Schauer an einem Sommertag. Der entstehende Regenbogen ist bei uns ein ‘Double Rainbow’, denn ‘wennschon, dennschon’ gilt auch heute noch. Darum haben wir die Dosis verdoppelt und bringen euch Astra! Astra! Party! Hits!
    Wir verordnen mehr 80er, 90er, 2000er, Trashpop, Eurodance & Hip-Hop/ Funk- Classics, also mehr feiern auf 2 Floors als Medizin mit viel Flüssigkeit einzunehmen. Zu Risiken und Nebenwirkungen ... ach Schnauze, lass feiern gehen! Kurz an der Bar dehnen und dann: ‘Letʻs dance’
    Mainfloor:
    DJ el mano (All-Time-Favorites)
    2Horn.Disko (Hip Hop)
    Danny D (90s, 2000er)
    Bingo Bongo: DJ Catchee (Girlpower)",
    link: 'https://www.virtualnights.com/berlin/event/astra-astra-party-hits.4241491',
    club_name: "THE PEARL",
    tag_list: ['mainstream']
  },
  {
    name: "KLUBNACHT MIT CHRIS TIETJEN",
    date: 20190615,
    description: "Techhouse - House Floor:
    Chris Tietjen (Cocoon)
    Kaldera (Karera, Well Done)
    speaknspell (Black Bouwie Rec.)
    Techno Floor:
    Cherry Core. Artist PAGE (Ost 1242,P11)
    BRUTE CTRL (Berlin)",
    link: 'https://www.virtualnights.com/berlin/event/klubnacht-mit-chris-tietjen.4249612',
    club_name: "THE PEARL",
    tag_list: ['classic']
  },
  {
    name: "RELOAD",
    date: 20190615,
    description: "Nur weil es ein Sonntag ist heißt es nicht das bei uns weniger gefeiert und getanzt werden darf.
    Warum auch nicht? Die Tanzflächen sind noch warm, die Anlage noch hochgefahren. Und schon stellt sich wieder der Hunger nach BASS ein. Eine Vorfreude durchzieht den Körper und lässt die Stimmung stetig steigen - endlich 'RELOAD' für alle Nachthelden!
    Flackernde Neonlichter weisen den Weg ins Matrix. Reload! Ist musikalisch ungebunden und extrem tanzbar! Egal ob Hip Hop, Electro oder Housebeats : wer Musik fühlt wird zur Musik (an)tanzen!
    Wir beginnen um 22 Uhr gewohnt entspannt und mit Euren Lieblingsdrinks um alsbald in die Vollen zu gehen.
    RELOAD ist Eure Partyoption in einer Sonntagnacht. Frische Beats. Extrem tanzbar. Mitten In Berlin. Für Nachthelden Eintritt frei bis 23h.
    Dancehall • Hip-Hop • R&B • Selected House",
    link: 'https://www.virtualnights.com/berlin/event/reload.4223338',
    club_name: "THE PEARL",
    tag_list: ['techno']
  },
  {
    name: "TECHNO MITTWOCH",
    date: 20190619,
    description: "TILL 0:00 FOR FREE
    Date / Wednesday
    Techno Jesus",
    link: 'https://www.virtualnights.com/berlin/event/techno-mittwoch.4221938',
    club_name: "THE PEARL",
    tag_list: ['mainstream']
  },
  {
    name: "ROCK AT SAGE",
    date: 20190620,
    description: "Musik Mainhall: Rock-Pop-Trash-Indie-Punk-Rap
    Musik Dragonfloor: Metal-Hardcore-Rock-Industrial
    Musik Separee: Trap-Hip-Hop-Soul-Funk
    Musik Garten: Rock Classics-Alternative-Punk-Dark Wave
    Freier Eintritt bis 22:00
    Ermäßigter Eintritt 4 EUR bis 24:00 über Facebook Gästeliste
    Eintritt ab 22:00 8 EUR
    Freier Eintritt für Geburtstagskinder der Woche + 1 (von Freitag zu Freitag//mit Ausweis!)
    Bandgästelisten bis 23:00
    Sage-Gästeliste: nur für Geschäftsfreunde und Freunde der Mitarbeiter
    UND: Einlaß erst mit 18! Ohne Ausnahme, da hilft auch kein Muttizettel. Sorry!
    Happy Hour: Cocktails 2for1 von 21 bis 22 Uhr",
    link: 'https://www.virtualnights.com/berlin/event/rock-at-sage.4127242',
    club_name: "THE PEARL",
    tag_list: ['house']
  },
  {
    name: "Bad Decisions Make Good Stories",
    date: 20190620,
    description: "Bad Decisions Make Good Stories
    Jeden Donnerstag drehen wir das Puro wieder auf links,
    denn Donnerstag ist der neue Freitag ;-)
    Bad Decisions Make Good Stories ist das Motto zu dem wir jeden Donnerstag zu feinster Hip Hop & Urban Music und euren Lieblinsgliedern tanzen und feiern!
    Mit DJ Lito Bolton, DJ Rokit & DJ Size haben wir auch diesen Donnerstag wieder einen Garanten für die perfekte Nacht!",
    link: 'https://www.virtualnights.com/berlin/event/bad-decisions-make-good-stories.4220588',
    club_name: "THE PEARL",
    tag_list: ['mainstream']
  },
  {
    name: "ELECTRIC MONDAY AT KIT KAT CLUB",
    date: 20190624,
    description: "Every Monday at Kit Kat Club we strive to bring you some of Berlin’s legends and upcoming talent, B-City style. A night where traveling DJs and Live Acts simmer down from the weekend to play you some fine music, exploring genres and picking out records to move you right. Be it on vinyl or digital, Deep House or Techno, trendy hip styles or classic vibes, this is your night.
    No limits, it’s a fun night seamlessly mixed. It’s the pulse of Berlin which ticks on and on… ELECTRIC MONDAY is the place to be, designed for this purpose. Just the right dose of clubbing. SEE YOU ON MONDAY!
    NO DRESSCODE – wear what you want – just be yourself!",
    link: 'https://www.virtualnights.com/berlin/event/electric-monday-at-kit-kat-club.4126305',
    club_name: "THE PEARL",
    tag_list: ['techno', 'house']
  },
  {
    name: "KANTINE DELUXE",
    date: 20190621,
    description: "Kantine deluxe für die crowd deluxe! Wer einmal in der Alten Kantine war, weiß was damit gemeint ist: die eingeschworene Gemeinde, die der guten Alten Kantine seit Jahren die Stange hält und sich selbst immer wieder erneuert. (Wer nicht weiß, worum es hier geht, der sollte sich schnellstens in die Knaackstr. 97 begeben und ein Teil dessen werden.) „You get what you give“ heißt es hier. Dies ist die Party, die EUCH, der Kantinen-Familie, Tribut zollt. Zwei ausgebuffte Trickser stehen dazu abwechselnd hinter den Decks: DJ Pasi, der versierte Allrounder, und DJ Toxic Twin, der gewiefte Spezialist in Fragen der Popmusik-Kultur. Selbstlos und wagemutig steuern diese beiden Helden unaufhaltsam auf den Höhepunkt zu.",
    link: 'https://www.virtualnights.com/berlin/event/kantine-deluxe.4125905',
    club_name: "THE PEARL",
    tag_list: ['mainstream', 'techno']
  },
  {
    name: "ELECTRO SWING REVOLUTION - FÊTE DE LA MUSIQUE EDITION",
    date: 20190621,
    description: "ESR ist Teil der FÊTE DE LA NUIT - EINTRITT FREI!
    Electro Swing Revolution im Frannz Club!
    Wir präsentieren als Gäste live on stage:
    Masha Ray & wolfgang lohr!
    MAIN FLOOR:
    Masha Ray (LIVE)
    wolfgang lohr (Berlin)
    Justin Fidèle (ESR)
    Louie Prima (ESR)
    ALL TIME FAVORITES FLOOR:
    DJ Dr.Mv",
    link: 'https://www.virtualnights.com/berlin/event/electro-swing-revolution-fete-de-la-musique-edition.4243045',
    club_name: "THE PEARL",
    tag_list: ['house']
  },
  {
    name: "GENERATION WILD",
    date: 20190621,
    description: "Generation Wild – erlaubt ist, was gefällt. Dies ist Berlins bester Auftakt für eine schweißtreibende Reise durch die Clubmusik. In der Diversität der musikalischen Stile schlägt das Herz der GENERATION WILD. HipHop meets Electro meets House Music meets RnB, Partyclassics … eine ganze Nacht im Glück der pulsierenden Bässe im freshsten Club der Stadt.
    Hier hat die Nacht keine Grenzen; manchmal beendet sie nicht einmal der Sonnenaufgang. Exzessive Partyanimals treffen auf animalischen Party Exzess. Generation Wild ist „der“ kollektive Partyabriss, bereit, um zum Start ins Partywochenende zu explodieren.
    All Time Favourites • Hip-Hop • House • R&B • Top40 • Deephouse • Electro • Progressive House",
    link: 'https://www.virtualnights.com/berlin/event/generation-wild.4223391',
    club_name: "THE PEARL",
    tag_list: ['classic']
  },
  {
    name: "SCHLAGER AN DER SPREE PARTY",
    date: 20190622,
    description: "Die Berliner Schlager-Community 'Schlager an der Spree' lädt jeden Samstag zur Schlagersause ins Pirates Berlin ein. Tanzt gemeinsam mit vielen anderen Schlagerfans in einer traumhaften Location direkt an der Spree und erlebt unvergessliche Schlagernächte. Es erwarten Euch jeden Samstag die besten Schlager- & Partyhits, wechselnde DJs & Schlager Entertainer sowie die süßen Schlagerettes, die immer Naschereien und lustige Schlager-Accessoires im Gepäck haben. Zum Chillen und Cocktails schlürfen zwischen den Tanzrunden gibt es eine wunderschöne Terrasse direkt am Wasser für die Gäste.",
    link: 'https://www.virtualnights.com/berlin/event/schlager-an-der-spree-party.4125828',
    club_name: "THE PEARL",
    tag_list: ['house', 'techno', 'hip-hop']
  },
  {
    name: "CIRCUS BIZZARE",
    date: 20190622,
    description: "Es steht alles auf dem Spiel, man tanzt die Nächte durch auf dem Vulkan, notfalls auch mit nackten Füßen, schrill, schnell, radikal, exzessiv, exaltiert und verrucht.
    Das trotzige Credo der Bohème Sauvage: 'Jetzt erst recht.'
    Die neue Freiheit sie ist so bunt und laut, als wüsste sie, dass ihr Kerkermeister im Morgengrauen schon wartet. Wild - Frivol - Sex-postiv
    Paradiesvögel, Freaks oder jene die es werden wollen, Neugierige und Gierige nach dem Neuen: in der Manege des bizarren Zirkus ist für alle Platz, die sich bislang nicht trauten, gesehen zu werden. Exzentrische Nachtschattengewächse bevölkern als Phantasmagorien das bizarre Amüsement, die Lost Generation pendelt zwischen Lebenshunger und Optimismus.
    Alles muss raus, auch die Ängste, die alten und die neuen. Burlesque, Fetisch und Barock treffen auf Dragqueens, Clowns, Liebhaber und Freaks.",
    link: 'https://www.virtualnights.com/berlin/event/circus-bizarre.4239845',
    club_name: "THE PEARL",
    tag_list: ['house', 'techno']
  }
]


event_attributes.each do |event_attribute|
  club_name = event_attribute.delete(:club_name)
  event = Event.new(event_attribute)
  event.club = Club.find_by(name: club_name)
  event.save!
end

puts 'Created events'

puts "Destroying all Users..."

User.destroy_all

user_attributes = [
{
  email: 'derric1abcABC@example.com',
  phone:'491738594856',
  city: 'berlin',
  password: '123ABC',
  tag_list: ['house', 'mainstream']
},
{
  email: 'nina1abcABC@example.com',
  phone:'491738594856',
  city: 'berlin',
  password: '123ABC',
  tag_list: ['house', 'techno']
},
{
  email: 'stefan1abcABC@example.com',
  phone:'491738594856',
  city: 'berlin',
  password: '123ABC',
  tag_list: ['techno', 'hip-hop']
},
{
  email: 'bob1abcABC@example.com',
  phone:'491738594856',
  city: 'berlin',
  password: '123ABC',
  tag_list: ['house']
},
{
  email: 'robert1abcABC@example.com',
  phone:'491738594856',
  city: 'berlin',
  password: '123ABC',
  tag_list: ['classic']
}
]

user_attributes.each do |user_attribute|
  User.create!(user_attribute)
end
puts 'Created Users'

puts 'Created all seeds'
