function _draw()
	cls(0)
	intro_text = "HELLO WORLD"
	for x=1,#intro_text do
		spr(ord(intro_text,x),8*(x-1),0)
	end
	map(0,0,0,8,11,1)
end

function _update60()

end
