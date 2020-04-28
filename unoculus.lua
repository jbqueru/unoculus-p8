function _init()
	back_logo=-1
	back_logo_y_split=0
	text_y=-8
	text_y_speed=0
	text_y_accel=0x0.1
end


function _update60()
	back_logo_y_split=(back_logo_y_split+1)%256
	if (back_logo_y_split==0) then back_logo=(back_logo+1)%2 end

	text_y+=text_y_speed
	text_y_speed+=text_y_accel
	if (text_y>128) then
		text_y=128
		if (text_y_speed < 0x0.c) then
			text_y_speed = 0
		else
			text_y_speed=-text_y_speed*0x0.c
		end
	end
end

function _draw()
	cls(0)

	if (back_logo&1!=0) then
		pal({0,0,0,3,3,3,3,0,0,0,0,3,3,3,3})
		palt(0b1111000011110000)
	else
		pal({0,0,0,0,0,0,0,3,3,3,3,3,3,3,3})
		palt(0b1111111100000000)
	end
	sspr(0,0,128,min(back_logo_y_split,128),0,0)

	if (back_logo&1==0) then
		pal({0,0,0,3,3,3,3,0,0,0,0,3,3,3,3})
		palt(0b1111000011110000)
	else
		pal({0,0,0,0,0,0,0,3,3,3,3,3,3,3,3})
		palt(0b1111111100000000)
	end
	if (back_logo>=0) then
		sspr(0,min(back_logo_y_split,128),128,128-min(back_logo_y_split,128),0,min(back_logo_y_split,128))
	end

	pal({8,14,15,0,8,14,15,0,8,14,15,0,8,14,15})
	palt(0b1000100010001000)
	map(0,0,0,text_y-9*8,16,9)
end
