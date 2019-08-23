class GustaveConverter
	def lambert93ToWgs84(x, y)
		x = x.to_f
		y = y.to_f
		b6  = 6378137.0000
		b7  = 298.257222101
		b8  = 1/b7
		b9  = 2*b8-b8*b8
		b10 = Math.sqrt(b9)
		b13 = 3.000000000
		b14 = 700000.0000
		b15 = 12655612.0499
		b16 = 0.7256077650532670
		b17 = 11754255.426096
		delx = x - b14
		dely = y - b15
		gamma = Math.atan( -(delx) / dely )
		r = Math.sqrt((delx*delx)+(dely*dely))
		latiso = Math.log(b17/r)/b16
		sinphiit0 = Math.tanh(latiso+b10*Math.atanh(b10*Math.sin(1)))
		sinphiit1 = Math.tanh(latiso+b10*Math.atanh(b10*sinphiit0))
		sinphiit2 = Math.tanh(latiso+b10*Math.atanh(b10*sinphiit1))
		sinphiit3 = Math.tanh(latiso+b10*Math.atanh(b10*sinphiit2))
		sinphiit4 = Math.tanh(latiso+b10*Math.atanh(b10*sinphiit3))
		sinphiit5 = Math.tanh(latiso+b10*Math.atanh(b10*sinphiit4))
		sinphiit6 = Math.tanh(latiso+b10*Math.atanh(b10*sinphiit5))
		longrad = gamma/b16+b13/180*Math::PI
		latrad = Math.asin(sinphiit6)
		long = (longrad/Math::PI*180)
		lat  = (latrad/Math::PI*180)
		return [lat, long]
	end

	def convert_coordinates
		Station.all.each do |station|
			incorrect_position = [station.latitude, station.longitude]
			correct_position = lambert93ToWgs84(incorrect_position[0], incorrect_position[1])
			station.latitude = correct_position[0]
			station.longitude = correct_position[1]
			station.save
		end
	end
end
