class AtmoParse
    require 'open-uri'
    require 'csv'
    require 'fastercsv'
	def return_last_data(periodicity="annuelle")
		registred_dpts = Department.get_registred_dpts.to_a
		registred_townships = Township.get_registred_townships.to_a
		registred_pollutants = Pollutant.get_registred_pollutants.to_a
		registred_stations = Station.get_registred_stations.to_a
		registred_measurements = Measurement.get_registred_measurements.to_a
		url  =  "https://geoservices.atmosud.org/geoserver/mes_sudpaca_#{periodicity}_poll_princ/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=mes_sudpaca_#{periodicity}_poll_princ:mes_sudpaca_#{periodicity}&outputFormat=csv&srsName=EPSG:2154"
		src = open(url)
		previous_row = { :nom_station => "", :nom_poll => "" }
		instance_variable_set("@last_data_#{periodicity}", [])
		CSV.foreach(src, {:headers => true, :header_converters => :symbol}) do |current_row|
			if (!registred_dpts.include?(current_row[:nom_dept]))
          dpt = Department.create!(dpt_name: current_row[:nom_dept], dpt_code: current_row[:insee_com][0..1])
          puts "successfully created Deptmt " + current_row[:nom_dept]
          registred_dpts << dpt.dpt_name
      end
      if (!registred_townships.include?(current_row[:nom_com]))
          town = Township.create!(department_id: Department.where(dpt_name: current_row[:nom_dept]).first, township_name: current_row[:nom_com], insee_code: current_row[:insee_com])
          puts "successfully created Township " + current_row[:nom_com]
          registred_townships << town.township_name
      end
      if (!registred_stations.include?(current_row[:nom_station]))
          (station = Station.create!(township: Township.where(township_name: current_row[:nom_com]).first, station_name: current_row[:nom_station], station_code: current_row[:code_station], typology: current_row[:typologie], influence: current_row[:influence], latitude: current_row[:x_l93], longitude: current_row[:y_l93]))
          puts "successfully created Station " + current_row[:nom_station]
          registred_stations << station.station_name
      end
      if (!registred_pollutants.include?(current_row[:nom_poll]))
          poll = Pollutant.create!(pollutant_name: current_row[:nom_poll], datasud_pollutant_id: current_row[:id_poll_ue], measurement_unit: current_row[:unite])
          puts "successfully created Pollutant " + current_row[:nom_poll]
          registred_pollutants << poll.pollutant_name
      end
      if (!registred_measurements.include?([current_row[:nom_station],current_row[:nom_poll],Date.parse(current_row[:date_debut])]))
				if current_row[:valeur]
						measurement = Measurement.create!(station: Station.where(station_name: current_row[:nom_station]).first, pollutant: Pollutant.where(pollutant_name: current_row[:nom_poll]).first, value: current_row[:valeur], measurement_periodicity: current_row[:metrique], measurement_start_date: Date.parse(current_row[:date_debut]), measurement_end_date: Date.parse(current_row[:date_fin]))
						puts "successfully created Measurement"
						registred_measurements << [current_row[:nom_station],current_row[:nom_poll],Date.parse(current_row[:date_debut])]
				end
      end
				eval("@last_data_#{periodicity} << [current_row[:nom_dept], current_row[:nom_com], current_row[:nom_station], current_row[:nom_poll], current_row[:valeur], current_row[:unite]] if ((previous_row[:nom_station] != current_row[:nom_station])||(previous_row[:nom_poll] != current_row[:nom_poll]))")
			previous_row = current_row
		end
		eval("@last_data_#{periodicity}")
	end

	def csv_size(url)
		csv_size = 0
		src = open(url)
		CSV.foreach(src, {:headers => true, :header_converters => :symbol}) do |row|
			csv_size += 1
		end
		puts csv_size
	end
end
