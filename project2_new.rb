class MyHash1
    
    def initialize
	@h = {'yes' => 23, 'b' => 'travel', 'yesterday' => 34, 5 => '234', :yesss => :fg, try: 30, key: 'some value', 'yesterday1' => 34, 'yesteryear' => 2014 }
    end
    
    def count_key
 	a = @h.keys
	a.map!(&:to_s)
	k = a.select{ |el| el.start_with?('yes') }.length
    end
    
end
#-------------------------------------------------------------------------------------
class MyHash2
   
    def initialize
	@h = {'yes' => 23, 'b' => 'travel', 'yesterday' => 34, 5 => '234', :yesss => :fg, try:  {'yesterday1' => 34, 'yesteryear' => 2014}, key: [{'yes' => 23, 'b' => 'travel'}], 'yesterday1'  => 34, 'yesteryear' => 2014 }
    end

    def h
	@h
    end	
   
    def hash_new_key(h1)
 	h1.inject({}) do |hh, (k,v)|
	    if v.instance_of? Hash 
		hh[k] = hash_new_key(v)
	    else
		if v.instance_of? Array
		    for el_v in v do
			new_array = []
			i = 0
			if el_v.instance_of? Hash 
			    new_array[i] = hash_new_key(el_v)
			else 
			    new_array[i] = el_v     	
			end
			i = i + 1
		    end
		    v = new_array			
		end		
		if k.instance_of? String 
		    hh[k.to_sym] = v
		else
		    hh[k] = v	
		end
	    end	
	    hh
	end
    end
    
end


