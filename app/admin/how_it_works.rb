ActiveAdmin.register HowItWork do
	form do |f|
	    f.inputs "How it works" do
	        f.input :heading
		    f.input :line1
		    f.input :line2
		    f.input :line3
		    f.input :line4
		    f.input :line5
	    end
	    f.actions	
	end
end
