# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# frozen_string_literal: true

Rails.application.eager_load!
models_array = [User, Topic, Dataset, DatasetCollection]
# Sets the locale to "France":
Faker::Config.locale = 'fr'

puts
puts '*' * 50
puts 'Open Air Seed'
puts '*' * 50
puts
puts "Deleting Database for the following models: #{models_array.join(' ')}."
puts '~' * 50
puts
models_array.each(&:destroy_all)
Faker::UniqueGenerator.clear
puts 'Done'
puts
puts 'Reinitiating tables index at 1'
ActiveRecord::Base.connection.tables.each do |t|
ActiveRecord::Base.connection.reset_pk_sequence!(t)
end
puts '~' * 50
puts
puts 'Done'
puts
puts "Database generation for #{models_array.join(' ')}"
puts '~' * 50
puts

models_items_count = Hash[[['User', 5], ['Topic', 9], ['Dataset', 15], ['DatasetCollection', 12]]]
topics_pics_paths_array = Rails.env.production? ? Dir.glob(Rails.root.join('public', 'assets', 'air-quality', '*.jpg')) :
 Dir.glob(Rails.root.join('app', 'assets', 'images', 'air-quality', '*.jpg'))

topic_driver_text = "Ceci est une introduction pour la section Driver de ma page. Je peux écrire en tant qu'admin ce que je veux afin d'introduire cette section qui contient les indicateurs de cette catégorie de mon sujet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam aliquet dui quam, vel cursus metus tempus non. Quisque id ante ac quam aliquam eleifend nec quis ante. Nulla purus orci."
topic_pressure_text = "Ceci est une introduction pour la section Pressure de ma page. Je peux écrire en tant qu'admin ce que je veux afin d'introduire cette section qui contient les indicateurs de cette catégorie de mon sujet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam aliquet dui quam, vel cursus metus tempus non. Quisque id ante ac quam aliquam eleifend nec quis ante. Nulla purus orci."
topic_state_text = "Ceci est une introduction pour la section State de ma page. Je peux écrire en tant qu'admin ce que je veux afin d'introduire cette section qui contient les indicateurs de cette catégorie de mon sujet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam aliquet dui quam, vel cursus metus tempus non. Quisque id ante ac quam aliquam eleifend nec quis ante. Nulla purus orci."
topic_impact_text = "Ceci est une introduction pour la section Impact de ma page. Je peux écrire en tant qu'admin ce que je veux afin d'introduire cette section qui contient les indicateurs de cette catégorie de mon sujet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam aliquet dui quam, vel cursus metus tempus non. Quisque id ante ac quam aliquam eleifend nec quis ante. Nulla purus orci."
topic_response_text = "Ceci est une introduction pour la section Response de ma page. Je peux écrire en tant qu'admin ce que je veux afin d'introduire cette section qui contient les indicateurs de cette catégorie de mon sujet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam aliquet dui quam, vel cursus metus tempus non. Quisque id ante ac quam aliquam eleifend nec quis ante. Nulla purus orci."
topic_count = 0
models_array.each do |model|
  puts
  puts "Generating #{models_items_count[model.name]} items for #{model.name}"
	puts "~"*50
	puts
  models_items_count[model.name].times do
    case model.name
    # when 'City'
    #   model.create(name: Faker::Nation.capital_city,
    #                zip_code: Faker::Number.number(5).to_s)

    when 'User'
      if User.all.size == models_items_count[model.name] - 1
        User.create(first_name: 'Had', last_name: 'Minh', email: 'admin@admin.com', password: 'AdminAdmin', is_admin: true)
        puts 'The password of User admin@admin.com is AdminAdmin (admin rights)'
      else
        password = Faker::Internet.password(13, 25, true, true)
        email = Faker::Internet.unique.email

        puts "The password of User #{email} is #{password}"

        model.create(first_name: Faker::Name.first_name,
                     last_name: Faker::Name.last_name,
                     email: email,
                     password: password,
                     password_confirmation: password)
      end
    when 'Topic'
      if topics_pics_paths_array.empty?
        puts
        puts "Issue: Unsufficient number of pics to generate the required amount of (#{models_items_count[model.name]}) topic items"
        puts

      else
        case topic_count
        			
					when 0
					# Maritime topic
						my_topic = model.new(title: "L'impact des zones portuaires sur la qualité de l'air",
																 short_description: "La pollution d’origine maritime s’intègre dans la pollution générale de la zone portuaire qui comprend aussi la pollution secondaire aux infrastructures, en particulier de transport routier nécessaire au port et la pollution propre à la ville, transport routier, chauffage, etc.
	Pour Marseille, par exemple, cette pollution maritime représente 5 à 10 pourcents de la pollution totale.",
																 driver_section_title: 'Fondements économiques du Port',
																 driver_section_intro: 'Port généraliste et 1er port de France, le Port de Marseille traite tout type de marchandise : hydrocarbures et vracs liquides (pétrole, gaz et produits chimiques), marchandises diverses (conteneurs et autres conditionnements), vracs solides (minerais et céréales).',
																 pressure_section_title: 'Emissions de polluants',
																 pressure_section_intro: 'Ci-dessous figurent une estimation des émissions annuelles totales des principaux polluants atmosphériques (SO2 - NOx équivalent NO2 - particules en suspension PM10 - particules en suspension PM2.5 - benzène C6H6 - Composés Organiques Volatils Non Méthaniques COVNM - Ammoniac NH3 - monoxyde de carbone CO - As - Cd - Ni - Pb – BaP sur la région Sud pour les années 2007, 2012 et 2010 à 2016. Toutes les données fournies sont kg. Le nombre de décimales varie en fonction du polluant.',
																 state_section_title: 'Mesures de pollution',
																 state_section_intro: "Ci-dessous figurent les niveaux annuels des polluants dioxyde d’azote NO2, particules en suspension PM10, ozone O3 et de l'Indice Synthétique air (ISA) dans l'air ambiant, issus de la modélisation de la région Sud par année sur les 5 dernières années. Toutes les données fournies sont en μg/m³ (microgramme par mètre cube).",
																 impact_section_title: 'Populations exposées',
																 impact_section_intro: 'Vous trouverez ici les populations et territoires exposés au dépassement des valeurs limites des PM10, PM2.5 et NO2 sur la région Sud pour les 5 dernières années.',
																 response_section_title: 'Indicateurs pilotes de la Politique Régionale',
																 response_section_intro: "Les 12 indicateurs annuels de Lutte contre le changement climatique et de protection de l'atmosphère ont pour objectif d’éclairer la prise de décision et la mise en œuvre d’actions permettant de répondre aux défis auxquels la région Provence-Alpes-Côte d’Azur est confrontée")

						my_topic.main_picture.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'port-marseille.jpg')), filename: 'port-marseille.jpg')

        			when 1
        				#Ozone topic
    		    	    my_topic = model.new(title: "Le rôle de l'ozone dans la pollution atmosphérique", 
    		    	    	short_description: "La Région Sud a connu ce jeudi 27 juin une canicule et un pic de pollution à l’ozone ayant conduit à des mesures de régulation inédites. L’ozone, ses causes et conséquences, la circulation alternée, qu’y comprenez-vous ? Cet article y répond en s’appuyant sur la base des données publiques régionales.", 
    		    	    	driver_section_title: "Qu'est-ce que l'ozone ?", 
    		    	    	driver_section_intro: "L’ozone est une molécule formée de 3 atomes d’oxygène. Sa présence dans l’atmosphère est naturelle. L’ozone se crée dans la stratosphère par une réaction entre le dioxygène présent dans l’air et les rayons UV de très courte longueur d’onde. À cette altitude la couche d’ozone nous est bénéfique par la filtration des rayonnements solaire les plus nocifs nous évitant les cancers de la peau.

À notre altitude, la présence d’ozone est un réel danger pour le vivant attaquant les poumons, les reins, les yeux, le système nerveux ainsi que les espèces végétales. De très faible concentration suffisent à provoquer des toux ainsi que des troubles du système nerveux et de la vision.
Dans l’atmosphère, cas pour lequel l’ozone est un polluant, il est nécessaire de distinguer les sources humaines des sources naturelles sur lesquelles il nous est difficile d’agir. On compte parmi ces dernières les feux de forêts, les fortes températures empêchant la dispersion de l’ozone vers les couches supérieures et également les arcs électriques dus aux orages.
L’activité humaine est responsable de formation d’ozone par la libération de particules chimiques telles que l’oxyde d’azote (NO), le dioxyde d’azote (NO2) ou les composé organiques volatiles (COV). Ces précurseurs peuvent alors former de l’ozone lorsqu'un atome d'oxygène réagit avec une molécule de dioxygène. Ainsi, des rayonnements ultraviolets, ou de fortes températures vont engendrer des réactions chimiques productrices d’ozone. L’ozone se forme donc beaucoup en été.
Instable, l'ozone possède une durée de vie de seulement quelques jours dans les basses couches de l'atmosphère. Il existe néanmoins des méthodes visant à le détruire : la chaleur en est une car sa durée de vie diminue, jusqu'à atteindre seulement quelques millisecondes à une température de 350 c°. Certains composés chimiques accélèrent sa dégradation; on parle alors de catalyseurs. Le charbon actif permet également de dégrader la molécule, en revanche cette méthode présente un risque de combustion.
Ci-dessous figurent les concentrations horaires issues du réseau fixe des mesures européennes en ozone (O3) dans l'air sur la région Corse. Toutes les données fournies sont en µg/m3 (microgramme par mètre cube) et l'historique disponible remonte à janvier 2017.", 
    		    	    	pressure_section_title: "L'émission de précurseurs", 
    		    	    	pressure_section_intro: "Les émissions décrites précédemment sont indissociables de leurs finalité. La pollution liée au trafic routier représente la grande majorité de la production de précurseurs d'ozone par l'Homme.", 
    		    	    	state_section_title: "Les Concentrations d'Ozone dans la Région Sud", 
    		    	    	state_section_intro: "La quantité d'ozone dans l'air augmente chaque année. L'augmentation de la production de précurseurs (oxydes d'azotes et composés organiques volatiles) par les pays de l'hémisphère nord tend à perpétrer cette évolution. Concernant les concentrations, elles sont positivement fortement corrélées au niveau d'ensoleillement ainsi qu'à l'activité et à la densité de la région.<br>Ci-dessous sont présentées les concentrations moyennes mensuelles et annuelles issues du réseau fixe de l'ozone (O3) dans l'air sur la Région Sud en microgramme par mètre cube.", 
    		    	    	impact_section_title: "Quel impact sur votre santé ?", 
    		    	    	impact_section_intro: "L'ozone provoque de sévères lésions des voies respiratoires et des muqueuses, notamment oculaires. A plus fortes concentrations, la même molécule peut provoquer des crises d'asthme, mais également atteindre le système nerveux. Les végétaux sont également fortement touchés. Des nécroses peuvent alors survenir et la croissance de la plante s'en trouve diminuée.", 
    		    	    	response_section_title: "Lois et réglementations", 
    		    	    	response_section_intro: "Actuellement, l'Organisation Mondiale de la Santé, l'Union Européenne ainsi que la France ont fixé des seuils critiques et convenu d'objectifs à atteindre à long terme concernant la qualité de l'air. Ces objectifs ont pour but de préserver l'environnement et les populations pouvant être exposées à de trop fortes concentrations.

Règlement de l'Union Européenne sur l'Ozone
https://ec.europa.eu/clima/policies/ozone/regulation_fr")
							my_topic.main_picture.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'ozone_peak.jpg')), filename: 'ozone_peak.jpg')

					when 2
					# Pollen topic
						my_topic = model.new(title: "Impact de la pollution urbaine sur les pollens en région PACA", 
																		short_description: "Dans la région, les concentrations de pollen dans l'air restent très élevés (cyprès, chênes, bouleaux, platanes oliviers). Un rapport de l'Anses (Agence nationale de sécurité sanitaire de l'alimentation, de l'environnement et du travail) informe sur l'action de l'ozone et du dioxyde d'azote sur les pollens.", 
																		driver_section_title: "La région PACA, une région dynamique et un pôle d'activité", 
																		driver_section_intro: "Avec ses 5 millions d'habitants, cette région connaît une activité économique qui génère un important trafic routier ainsi que des besoins énergétiques. Garante d'un riche patrimoine naturel, la région est reconnue pour l'exceptionnelle variété d'espèces qui composent son paysage.", 
																		pressure_section_title: "Le pollen menacé par notre activité", 
																		pressure_section_intro: "Lorsque l'on se chauffe, ou l'on prend les transports en commun, cela répand des oxydes d'azotes qui sont ensuite libérés dans l'air extérieur. On estime aujourd'hui que plus de la moitié de ces émissions sont due au trafic routier et à près de 20 % la part générée par le chauffage.", 
																		state_section_title: "L'activité pollinique en France", 
																		state_section_intro: "40 % de la population française inspire quotidiennement trop de particules fines. L'impact est problématique, particulièrement pour les personnes allergiques qui présentent un risque accru de développer un asthme allergique ou bronchique. De plus l'ozone présent dans la troposphère nous affecte directement et accroît la perméabilité des muqueuses rendant ainsi la population sensible à un nombre de plus en plus important allergènes.", 
																		impact_section_title: "Pollen et polluants, une réaction à risques", 
																		impact_section_intro: "Si certains pollens sont naturellement allergènes il est désormais admis que la pollution atmosphérique présente un impact sur les fonctions reproductrices des plantes, mais également sur le de transport des pollens, puisque la fragilisation de la membrane cytoplasmique des grains de pollen augmente le risque que l'allergène soit libéré et peut également fragmenter les particules allergènes et ainsi leur faire atteindre une taille qui leur permet ensuite de pénétrer dans le système respiratoire bien plus profondément que les grains de pollen sains (en deça de 4.5 micromètres).", 
																		response_section_title: "Lois et règlementation", 
																		response_section_intro: "not written yet")

						my_topic.main_picture.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'pollen.jpg')), filename: 'pollen.jpg')
					when 3
					#AéroportMarseilleProvence
						my_topic = model.new(title: "Aéroport Marseille Provence: Impact territorial",
                                    short_description: "L’Aéroport Marseille Provence ne se préoccupe pas que de croître en nombre de destinations, de passagers et de fret. Avec ses 9,4 millions de passagers, ses 56 695 tonnes de fret et ses investissements conséquents (500 millions d’euros à l’horizon 2025), il sait que chacune de ses activités engendre un impact sur le territoire.",
                                    driver_section_title: "Pus de 3.8 millions de passagers par an",
                                    driver_section_intro: "Après, cela ne nous dédouane pas pour autant. Parmi les actions mises en place, le suivi et le bilan de nos émissions de polluants. Nous sommes en train de finaliser notre adhésion à Atmosud », qui assurera un suivi régulier de la qualité de l’air sur la plateforme courant 2019, et permettra la mise en place d’actions visant à réduire les émissions des différents acteurs de la plateforme. Pour ce qui est des gaz à effet de serre, là encore, sur les 39 millions de tonnes de CO2 de la région Sud, moins de 2% sont liés au secteur aérien. « Et il ne représente que 3,6% des émissions atmosphériques au niveau européen, ce qui là non plus n’est pas significatif. Mais depuis 2013, nous nous sommes lancés dans une démarche volontariste avec l’obtention de la certification Airport Carbon Accreditation.",
                                    pressure_section_title: "Système de mesure du pollution et suivies des trajectoires",
                                    pressure_section_intro: "Un système de mesure de bruit et de suivi des trajectoires des aéronefs est en fonctionnement depuis septembre 2004. Il comprend quatre stations de mesure fixes, une station mobile et quatre stations de mesure semi-mobiles réparties sur sept sites : Les Pennes Mirabeau, Marignane, Marseille (quartier de Malmousque), Ensuès-la-Redonne, Rognac, Gignac-la-Nerthe et Vitrolles.",
                                    state_section_title: "Pollution élevée",
                                    state_section_intro: "Certains champs de la Responsabilité sociétale des entreprises (RSE), à l’instar de la réduction des nuisances sonores, sont en partie cadrés sur le plan réglementaire, cela n’empêche pas l’aéroport Marseille Provence (AMP) de faire preuve d’initiative en matière de développement durable. Car il sait pertinemment que sa croissance économique est indissociable de sa performance environnementale et donc, de la lutte contre les impacts de son trafic... Panorama des actions engagées.",
                                    impact_section_title: "Polution du Salin des Lions",
                                    impact_section_intro: "Enfin, AMP préserve la biodiversité. Il œuvre déjà sur la problématique rencontrée par tous les aéroports et gérée depuis longue date : les impacts du trafic sur la population aviaire. « Un des risques étant d’avoir des collisions entre les oiseaux et les avions. Au sein d’AMP, une équipe est totalement dédiée à la prévention du péril animalier. Elle cultive une très bonne connaissance des populations implantées à proximité, quelles espèces et à quelles périodes de l’année, elle détermine où elles nichent, où elles se nourrissent.",
                                    response_section_title: "Les énergies renouvelables",
                                    response_section_intro: "L’appel aux énergies renouvelables se généralise pour les besoins aéroportuaires parallèlement aux efforts de maîtrise de l’énergie (- 60% sur l’éclairage grâce au renouvellement intérieur et extérieur). La future centrale photovoltaïque prévue sur un nouveau parking à étages pourvoira à terme à 10% de l’électricité consommée par la plate-forme. Enfin, AMP œuvre à la préservation de la biodiversité sur ses zones naturelles (2/3 de ses 600 hectares). Près de 110 espèces régulières ont été par exemple recensées sur les salins du Lion, sa « petite Camargue ». La démarche pédagogique de découverte sera accentuée cette année. Une initiative conduite en coopération avec les communes, comme Vitrolles qui songe à un sentier du littoral, et les associations, comme Etang Maintenant.")

            my_topic.main_picture.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'airport.jpg')), filename: 'airport.jpg')
					when 4
					
						my_topic = model.new(title: "Influence des transports publics à Marseille sur la qualité de l'air (article factice)",
                                    short_description: "Ouverture de lignes de métros et fin du plus grand réseau de tramway français dans les années 80, puis ouverture de nouvelles lignes de tramways dans les années 2010, Marseille a connu de grands changements dernièrement. Pourtant, elle reste à la traine de Lyon en terme de transports publics et sa qualité de l'air est décriée. Quel bilan?",
                                    driver_section_title: "La stratégie de transport public de la métropôle Aix-Marseille",
                                    driver_section_intro: "La métropole Aix-Marseille a pris le relais de la Ville de Marseille dans la définition de la politique de transport public. Comment celle-ci est-elle définie aujourd'hui? Le faible développement des transports publics est aujourd'hui notoire. Sur l'exemple du vélo notamment, la métropole phocéenne compte seulement 130 kilomètres de pistes cyclables, contre 750 kilomètres pour l'agglomération lyonnaise. Même constat sur le cas des transports en commun: Marseille n'accueille que 1 129 kilomètres de lignes de bus, tramway et métro, contre 3 886 kilomètres à Lyon.",
                                    pressure_section_title: "Baisse d'émissions de polluants par les transports publics",
                                    pressure_section_intro: "Quelle est la part du transport en commun sur les émissions de polluants? Quels polluants sont émis? Quel est le niveau de baisse des polluants suite à l'installation du métro? Il n'existe pas de bases de données disponibles publiquement à ce jour sur ce sujet.",
                                    state_section_title: "Influence des transports publics sur les taux de NOx et Particules fines",
                                    state_section_intro: "Cette section détaille les concentrations de polluants dans les zones marquées par l'utilisation des transports publics (10% des transports métropolitains), avant et après leur installation. Il n'existe pas de bases de données disponibles à ce jour sur cette section.",
																		impact_section_title: "Niveaux de dangerosité pour la population",
																		impact_section_intro: "Que ce soit en période de pic de pollution ou avec la pollution de fond, les risques des microparticules sur la santé sont principalement respiratoires et cardio-vasculaires. Si chez l'adulte en bonne santé, la pollution aux microparticules (inférieures à 2,5 microns, appelées PM2,5) provoque seulement une gêne passagère (toux, yeux qui piquent...), c'est un facteur aggravant chez les personnes souffrant d’une maladie respiratoire comme une broncho-pneumopathie chronique ou de l'asthme, ainsi que chez les enfants (dont les poumons sont encore immatures) et les personnes âgées ( qui ont une capacité ventilatoire diminuée).",
                                    response_section_title: "Réglementation & Gouvernance",
                                    response_section_intro: "Depuis le 1er janvier 2016, la Métropole Aix-Marseille-Provence (créée par la loi MAPTAM du 27 janvier 2014) est l’autorité organisatrice de la mobilité (AOM) sur son territoire, et donc de la RTM (Régie des Transports Métropolitains). Elle dispose d’un budget annexe Transports. Les relations juridiques, administratives et financières RTM/AOM sont déterminées dans un Contrat d’Obligation de Service Public.") 
            my_topic.main_picture.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'electric_bus.jpg')), filename: 'electric_bus.jpg')

	          		
=begin
          when 5
            my_topic = model.new(title: "", short_description: "", driver_section_title: "", driver_section_intro: "", pressure_section_title: "", pressure_section_intro: "", state_section_title: "", state_section_intro: "", impact_section_title: "", impact_section_intro: "", response_section_title: "", response_section_intro: "")
						my_topic.main_picture.attach(io: File.open(Rails.root.join('app', 'assets', 'images', '.jpg')), filename: '.jpg')
=end

        	else
						my_topic = model.new(title: Faker::Lorem.paragraph_by_chars(50, false),
																 short_description: Faker::Lorem.paragraph_by_chars(256, false),
																 driver_section_title: 'Besoins socio-économiques',
																 driver_section_intro: topic_driver_text,
																 pressure_section_title: 'Emissions',
																 pressure_section_intro: topic_pressure_text,
																 state_section_title: 'Etats',
																 state_section_intro: topic_state_text,
																 impact_section_title: 'Impacts',
																 impact_section_intro: topic_impact_text,
																 response_section_title: 'Réglementations',
																 response_section_intro: topic_response_text)
						my_topic.main_picture.attach(io: File.open(topics_pics_paths_array.pop), filename: ('picture ' + my_topic.title.to_s + '.jpg'))
        end

        my_topic.save
        topic_count += 1
      end
    when 'DatasetCollection'
      loop do
        dataset_collection = model.new(user: User.all.sample, dataset: Dataset.all.sample)
        break if dataset_collection.save
      end

    when 'Dataset'
      if Dataset.all.size > 7 # once we have created datasets linked to Topic.first - Maritime pollution
        FactoryBot.create(:dataset, topic: Topic.all[1..-1].sample) if Dataset.all.size < models_items_count[model.name]

      else
        # Maritime_port_dataset
        model.create(
          topic: Topic.first,
          title: 'Synthèse des drivers économiques',
          db_link: 'https://trouver.datasud.fr/dataset/indicateur-de-contexte-du-tableau-de-bord-regional-du-developpement-durable/resource/42bceea5-a110-47e2-baed-b0b4499f9bf2/view/fb69d6f0-2cae-46aa-9db7-dbf887bf7d29',
          dpsir_category: 'Driver',
          description: 'Liste des 8 indicateurs de contexte ( un par feuillet du tableur) :
Tableau 1 : Population totale
Tableau 2 : Indice de vieillissement (rapport des 65 ans et plus/moins de 20 ans)
Tableau 3 : Part des moins de 20 ans dans la population
Tableau 4 : Espérance de vie à la naissance des hommes
Tableau 5 : Espérance de vie à la naissance des femmes
Tableau 6 : PIB par habitant
Tableau 7 : Nombre d’établissements SEVESO pour 1000 km2
Tableau 8 : Part des superficies en sites « Natura 2000 »',
          rendered: true,
          file_type: 'xls'
        )

        # do not render
        model.create(
          topic: Topic.first,
          title: 'Activité maritime',
          db_link: 'https://trouver.datasud.fr/dataset/les-lignes-maritimes-regulieres-touchant-le-port-de-marseille-fos',
          dpsir_category: 'Driver',
          description: '55 services maritimes réguliers relient le Port de Marseille-Fos à plus de 500 autres ports et desservent près de 160 pays dans le monde. ',
          rendered: false,
          file_type: 'pdf'
        )

        model.create(
          topic: Topic.first,
          title: "Emissions de polluants des EPCI (Intercommunalités) tous secteurs d'activité confondus dans la région Sud",
          db_link: 'https://trouver.datasud.fr/dataset/emissions-de-polluants-atmospheriques-tous-secteurs-dactivite-confondus-des-epci-de-la-region-sud/resource/54515d61-8274-40a4-93d2-6b4e64387307/view/9f6b117c-badf-4d0e-a11a-206122277194',
          dpsir_category: 'Pressure',
          description: "Estimation des émissions annuelles totales des principaux polluants atmosphériques (SO2 - NOx équivalent NO2 - particules en suspension PM10 - particules en suspension PM2.5 - benzène C6H6 - Composés Organiques Volatils Non Méthaniques COVNM - Ammoniac NH3 - monoxyde de carbone CO - As - Cd - Ni - Pb – BaP sur la région Sud pour l'année 2016. Toutes les données fournies sont kg. Le nombre de décimales varie en fonction du polluant.",
          rendered: true,
          file_type: 'xls'
        )

        # kind: qml, do not render...
        model.create(
          topic: Topic.first,
          title: "Évolution de l'occupation du sol en Provence-Alpes-Côte d'Azur entre 2006 et 2014 ",
          db_link: 'https://trouver.datasud.fr/dataset/evolution-de-loccupation-du-sol-en-provence-alpes-cote-dazur-entre-2006-et-2014/resource/78256182-39b7-4938-a6ae-e08a6fa54788',
          dpsir_category: 'State',
          description: "Cartographie de l'occupation des sols de la Région PACA en 2006, réalisée par traitement d'images satellitaires, d'après la nomenclature européenne CORINE Land Cover, adaptée aux spécificités régionales.",
          rendered: false,
          file_type: 'map'
        )

        # map, do not render#map, do not render
        model.create(
          topic: Topic.first,
          title: 'Modélisations annuelles des polluants principaux sur la région Sud ',
          db_link: 'https://trouver.datasud.fr/dataset/niveaux-annuels-de-polluants-dans-l-air-ambiant-issus-de-la-modelisation-sur-la-region-sud',
          dpsir_category: 'State',
          description: "Niveaux annuels des polluants dioxyde d’azote NO2, particules en suspension PM10, ozone O3 et de l'Indice Synthétique air (ISA) dans l'air ambiant, issus de la modélisation de la région Sud par année sur les 5 dernières années. Toutes les données fournies sont en μg/m³ (microgramme par mètre cube). Statistiques selon la réglementation en vigueur pour chaque polluant :

  - PM10 : 36e moyenne journalière la plus élevée. Unité : microgramme par mètre-cube (µg/m3).
  - PM10 : moyenne annuelle. Unité : microgramme par mètre-cube (µg/m3).
  - PM2.5 : moyenne annuelle. Unité : microgramme par mètre-cube (µg/m3).
  - NO2 : moyenne annuelle. Unité : microgramme par mètre-cube (µg/m3).
  - O3 : 26e maximum journalier de la moyenne sur 8h le plus élevé. Unité : microgramme par mètre-cube (µg/m3).
  - ISA : indice non réglementaire cumulant les concentrations annuelles de NO2, PM10 et O3 normalisées par leurs lignes directrices OMS respectives. Valeurs sans unité, variations habituelles entre 0 et 100.

Donnée créée avec un modèle de dispersion atmosphérique à l'échelle locale (ADMS Urban). Utilisation de l'inventaire des émissions de la région Sud. Statistiques comparables aux valeurs limites pour la protection de la santé : Décrets N°98-360, 2002-213, 2003-1085, 2007-1479, 2008-1152, 2010-1250 et Directive 2008/50/CE. Modélisation réalisée conformément aux recommandations du référentiel métier du Laboratoire Central de Surveillance de la Qualité de l’Air (LCSQA).

La résolution est de 25 m pour toute les couches, sauf celles pour l'ozone qui sont à 1 km.
",
          rendered: false,
          file_type: 'map'
        )

        # map, do not render
        model.create(
          topic: Topic.first,
          title: 'Mesures horaires de polluants',
          db_link: 'https://trouver.datasud.fr/dataset/concentrations-horaires-de-polluants-dans-lair-ambiant-issues-du-reseau-permanent-de-mesures-automa/resource/99680cee-3efe-439f-bb60-f99e25537779',
          dpsir_category: 'State',
          description: "Concentrations moyennes horaires issues du réseau fixe des mesures européennes des principaux polluants réglementés dans l'air sur la région Sud : dioxyde de soufre SO2, monoxyde d'azote NO et dioxyde d'azote NO2, particules en suspension PM10, particules en suspension PM2.5, ozone O3, benzène C6H6, monoxyde de carbone CO. Toutes les données fournies sont en μg/m³ (microgramme par mètre cube) sauf CO (mg/m³).",
          rendered: false,
          file_type: 'map'
        )

        # map, do not render
        model.create(
          topic: Topic.first,
          title: 'Exposition aux PM2,5',
          db_link: 'https://trouver.datasud.fr/dataset/populations-et-territoires-exposes-au-depassement-des-valeurs-limites-sur-la-region-sud/resource/77c2d91d-5bfb-4911-8db9-d169a4d33b14#bbox=3.8836669916473716,43.46089377519706,5.28991699145153,44.645208218791495',
          dpsir_category: 'Impact',
          description: "Populations et territoires exposés au dépassement des valeurs limites des PM10 et NO2 sur la région Sud pour les 5 dernières années.
En complément, sont diffusés également les chiffres d'exposition pour d'autres valeurs de référence (valeurs cibles et lignes directrices OMS).
",
          rendered: false,
          file_type: 'map'
        )

        # xls, pdf, do not render
        model.create(
          topic: Topic.first,
          title: "Lutte contre le changement climatique et protection de l'atmosphère : Indicateurs de développement durable ",
          db_link: 'https://trouver.datasud.fr/dataset/lutte-contre-le-changement-climatique-et-protection-de-latmosphere-indicateurs-de-developpement-dur',
          dpsir_category: 'Response',
          description: 'Ce tableau de bord du développement durable a pour objectif d’éclairer la prise de décision et la mise en œuvre d’actions permettant de répondre aux défis auxquels la région Provence-Alpes-Côte d’Azur est confrontée. Ce diagnostic annuel de l’état du développement durable en région a vocation à alimenter les projets territoriaux de planification comme l’Agenda 21 régional, le Schéma régional d’aménagement et de développement durable du territoire, etc..',
          rendered: false,
          file_type: 'map'
        )

      end
    end
  end
end

puts 'Done'
puts
puts 'View of the last 3 items for all tables'
puts '-' * 50
puts

models_array.each do |model|
  puts "#{model.name} : #{model.count} items"
  unless models_items_count[model.name] == model.count
    puts "ISSUE of Validation ? the number of generated items differs from the requested one: #{models_items_count[model.name]}"
  end
  puts
  tp model.last(3)
  puts
end

puts '*' * 80
puts
puts 'Please note you have an Admin Access (required for the Content Writer Dashboard): '
puts 'login > admin@admin.com'
puts 'password > AdminAdmin'
puts
puts '*' * 80
