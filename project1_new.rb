class MyArray
    
    def initialize(n,m)
	@a = Array.new(n).map!{ Array.new(m){ rand(-10..10) } }
    end
    
    def print_array
     	@a.each{ |mas| puts ' '+mas.each{ |element| print element.to_s+' ' }.to_s }
    end
    
    def sum
	s = 0
	@a.flatten.each{ |el| (puts el; s += el) if el<0 }
	s
    end    
	
end

class MyArray2 

    def initialize
	@a = Array.new(40)
	@a.map! do |el| 
   	    rnd_date = rand((Time.now - 60*60*24*365)..Time.now)
	    el = rnd_date.day.to_s+"."+rnd_date.month.to_s + " " + rand(-25..35).to_s
	end
     end

    def avg_temp_month 
  	tr = Array.new(12)
	
	(1..12).each do |month| 
	    s=0; k=0; avg=0
	    for el in @a do
		d = el.split(/[.\s]/)
		m = d[1].to_i
		t = d[2].to_i
		if m==month 
		    s = s + t
		    k = k + 1
		end
	    end
	    avg = s/k if k!=0
	    puts month.to_s + ": average temperature is " + avg.to_s
	    tr[month-1] = month.to_s + ": average temperature is " + avg.to_s 	
	end  
	
	tr
    end	

end
