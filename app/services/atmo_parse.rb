class AtmoParse
    require 'open-uri'
    require 'csv'
    require 'fastercsv'
def return_last_data
    
  url  =  "https://geoservices.atmosud.org/geoserver/mes_sudpaca_horaire_poll_princ/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=mes_sudpaca_horaire_poll_princ:mes_sudpaca_horaire&outputFormat=csv&srsName=EPSG:2154"
  src = open(url)
  CSV.foreach(src, {:headers => true, :header_converters => :symbol}) do |row|
    	puts !!compare_station(row[:nom_dept], row[:nom_com], row[:nom_station])
		end
	end
	def compare_department(department_name_in_csv)
 		(Department.get_registred_dpts.to_a.map!{|rx| rx.dpt_name}).include?(a)
	end
end
