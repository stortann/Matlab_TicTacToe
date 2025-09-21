function [ ok ] = PlayerInputOk( x, y, roz )
    if not((x>0) && (x<=roz)) || not((y>0) && (y<=roz))
    	ok = false; 
    else
        ok = true; 
    end
end

