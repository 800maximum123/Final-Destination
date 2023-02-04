/obj/structure/ship_munition/ammobox/beam_cannon
	name = "2000 MW gun cell"
	desc = "2000 megawatts military grade powercell, often used in giant ship-mounted ion beams."
	layer = 2.22
	ammo_count = 2000
	ammo_type = null

/obj/structure/ship_munition/ammobox/beam_cannon/examine(mob/user)
	. = ..()
	to_chat(user, "There [(ammo_count == 1)? "is" : "are"] [ammo_count] MW charge left!")