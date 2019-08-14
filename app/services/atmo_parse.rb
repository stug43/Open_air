class AtmoParse
    require 'open-uri'
    require 'csv'
    require 'fastercsv'
	def return_last_data	
		registred_dpts = Department.get_registred_dpts.to_a
		registred_townships = Township.get_registred_townships.to_a
		registred_pollutants = Pollutant.get_registred_pollutants.to_a
		registred_stations = Station.get_registred_stations.to_a
		url  =  "https://geoservices.atmosud.org/geoserver/mes_sudpaca_horaire_poll_princ/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=mes_sudpaca_horaire_poll_princ:mes_sudpaca_horaire&outputFormat=csv&srsName=EPSG:2154"
		src = open(url)
		previous_row = ""
		compteur = 0
		CSV.foreach(src, {:headers => true, :header_converters => :symbol}) do |current_row|
			last_data = []
    	if registred_dpts.include?(current_row[:nom_dept])
				nil
				puts "nil"
			else
				if dpt = Department.create!(dpt_name: current_row[:nom_dept], dpt_code: current_row[:insee_com][0..1])
					puts "successfully created Deptmt"
					registred_dpts << dpt.dpt_name
				else
					puts "error in Dptmt validation"
				end
			end
			if registred_townships.include?(current_row[:nom_com])
        nil
        puts "nil"
      else
        if town = Township.create!(department_id: Department.where(dpt_name: current_row[:nom_dept]).first, township_name: current_row[:nom_com], insee_code: current_row[:insee_com])
          puts "successfully created Township" + current_row[:nom_com]
					registred_townships << town.township_name
        else
          puts "error in Station validation"
        end
      end
			if registred_stations.include?(current_row[:nom_station])
        nil
				puts "nil"
      else
        if station = Station.create!(township: Township.where(township_name: current_row[:nom_com]).first, station_name: current_row[:nom_station], station_code: current_row[:code_station], typology: current_row[:typologie], influence: current_row[:influence], latitude: current_row[:x_l93], longitude: current_row[:y_l93])
          puts "successfully created Station" + current_row[:nom_station]
					registred_stations << station.station_name
        else
          puts "error in Station validation"
        end
      end
			if registred_pollutants.include?(current_row[:nom_poll])
        nil
				puts "nil"
      else
        if poll = Pollutant.create!(pollutant_name: current_row[:nom_poll], datasud_pollutant_id: current_row[:id_poll_ue], measurement_unit: current_row[:unite])
          puts "successfully created Deptmt" + current_row[:nom_station]
					registred_pollutants << poll.pollutant_name
        else
          puts "error, Dptmt validation" + current_row[:nom_station]
        end
      end
			######################
			compteur += 1
			break if compteur >= 30000
		end
		Department.all.each {|k| puts k.dpt_name}
		puts
		puts "*"*120
		puts
		Township.all.each {|k| puts k.township_name}
    puts
    puts "*"*120
    puts
		Station.all.each {|k| puts k.station_name}
		puts
		puts "*"*120
		puts
		Pollutant.all.each {|k| puts k.pollutant_name}
    puts
    puts "*"*120
    puts
	end
end
