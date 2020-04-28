function _init()
	memset(0,0,0x2000)
	reload(0x2000,0,0x2000,"logo1.p8")
	for addr=0,0x1fff do
		out=peek(addr)
		if peek(0x2000+addr) & 15 != 0 then
			out |= 4
		end
		if peek(0x2000+addr) & 15<<4 != 0 then
			out |= 4<<4
		end
		poke(addr,out)
	end
	reload(0x2000,0,0x2000,"logo2.p8")
	for addr=0,0x1fff do
		out=peek(addr)
		if peek(0x2000+addr) & 15 != 0 then
			out |= 8
		end
		if peek(0x2000+addr) & 15<<4 != 0 then
			out |= 8<<4
		end
		poke(addr,out)
	end
	reload(0x2000,0,0x2000,"font.p8")
	for addr=0,0x1fff do
		out=peek(addr)
		out |= peek(0x2000+addr) & 0x33
		poke(addr,out)
	end
	-- cstore(0,0,0x2000,"unoculus-test.p8")
end

function _draw()
	cls(0)
	spr(0,0,0,16,16)
end
