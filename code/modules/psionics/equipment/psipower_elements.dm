/obj/item/psychic_power/psielectro
	name = "orb of energy"
	force = 5
	edge = TRUE
	maintain_cost = 10
	icon_state = "electro"
	item_state = "electro"
	attack_cooldown = 5
	var/used = FALSE
	var/cooldown = 0
	var/ranged = FALSE

/obj/item/psychic_power/psielectro/Process()
	if(used && (cooldown > 0))
		cooldown--
	if(used && cooldown <= 0)
		used = FALSE
		cooldown = 10

	. = ..()

/obj/item/psychic_power/psielectro/New(var/mob/living/user)
	var/el_rank = user.psi.get_rank(PSI_METAKINESIS)
	maintain_cost -= el_rank

	if(user.psi && !user.psi.suppressed && user.psi.get_rank(PSI_METAKINESIS) == PSI_RANK_GRANDMASTER)
		ranged = TRUE

	..()

/obj/item/psychic_power/psielectro/afterattack(atom/A as mob|obj|turf|area, var/mob/living/user as mob, proximity)

//TURFS AND ANYTHING ELSE

	if(proximity)
		var/datum/effect/effect/system/spark_spread/sparks = new ()
		sparks.set_up(3, 0, get_turf(A))
		sparks.start()

	if(!proximity && !ranged)
		return

	var/el_rank = user.psi.get_rank(PSI_METAKINESIS)

//MOBS

	if(istype(A, /mob/living))
		var/mob/living/target = A

		if(used)
			to_chat(user, "<span class='warning'>�� �� ������ ������������ ������ ����������� ��������� �����!</span>")
			return
		if(target == user)
			to_chat(user, "<span class='warning'>�� �� ������ �������� ������ ����!</span>")
			return
		if(user.psi && !user.psi.suppressed && user.psi.get_rank(PSI_METAKINESIS) <= PSI_RANK_OPERANT)
			user.visible_message("<span class='danger'>[user] ���������� ����� ���-�������� ������ � ���� [target]!</span>")
		if(user.psi && !user.psi.suppressed && user.psi.get_rank(PSI_METAKINESIS) >= PSI_RANK_MASTER)
			user.visible_message("<span class='danger'>[user] �������� [target] ������ ������������� �������!</span>")
		if(target.psi && !target.psi.suppressed)
			var/el_rank_target = target.psi.get_rank(PSI_METAKINESIS)
			if(el_rank_target >= el_rank && prob(40))
				user.visible_message("<span class='danger'>[target] ���������� ��� ����� ����, ��������� ��� [user] � ���� ������!</span>")
				user.electrocute_act(rand(el_rank_target * 2,el_rank_target * 5), target, 1, target.zone_sel.selecting)
				used = TRUE
				new /obj/effect/temporary(get_turf(user),3, 'icons/effects/effects.dmi', "electricity_constant")
				return TRUE
			if(el_rank_target >= PSI_RANK_GRANDMASTER)
				user.visible_message("<span class='danger'>[target] ���������� ��� ����� ����, ��������� ��� [user] � ���� ������!</span>")
				user.electrocute_act(rand(el_rank_target * 4,el_rank_target * 6), target, 1, target.zone_sel.selecting)
				used = TRUE
				new /obj/effect/temporary(get_turf(user),3, 'icons/effects/effects.dmi', "electricity_constant")
				return TRUE
		target.electrocute_act(rand(el_rank * 2,el_rank * 5), user, 1, user.zone_sel.selecting)
		used = TRUE
		new /obj/effect/temporary(get_turf(target),3, 'icons/effects/effects.dmi', "electricity_constant")
		return TRUE

//LIGHT

	if(istype(A, /obj/machinery/light))
		var/obj/machinery/light/lighting = A
		if(lighting.on)
			if(user.psi && !user.psi.suppressed && user.psi.get_rank(PSI_METAKINESIS) >= PSI_RANK_OPERANT)
				if(do_after(user, 30))
					if(proximity)
						user.visible_message("<span class='danger'>[user] ���������� ���� � ��������� �����, � ��� ����� ���� ������ �� �������!</span>")
						to_chat(user, "<span class='warning'>�� ����������� ���� � ������� �����, ��������� �� �� �� ����������!</span>")
					else
						user.visible_message("<span class='danger'>[user] ����������� ���� � [lighting], � �����, ������ ������� �������� ��� �������, ������� � �� ���������!</span>")
						to_chat(user, "<span class='warning'>�� � ������� ���������� �������� �����, ��������� �� �������������, ������� � �� ����.</span>")
					lighting.broken(TRUE)
					user.psi.stamina = min(user.psi.max_stamina, user.psi.stamina + rand(5,10))
		else
			return

//CELLS

	var/obj/item/cell/charging_cell = A.get_cell()
	if(istype(charging_cell))
		if(proximity)
			user.visible_message("<span class='warning'>[user] ������������ ���� � [charging_cell], �������� � ��������!</span>")
		else
			user.visible_message("<span class='warning'>[user] ���������� ���� � [charging_cell], ������� � �� ����� ������!</span>")
		charging_cell.give(rand(el_rank * 3,el_rank * 6))
		new /obj/effect/temporary(get_turf(A),3, 'icons/effects/effects.dmi', "electricity_constant")
		return TRUE

//AIRLOCKS

	if(istype(A,/obj/machinery/door/airlock))
		var/obj/machinery/door/airlock/D = A
		var/option = input(user, "Do something!", "What do you want to do?") in list("Open/Close", "Bolt/Unbolt", "Electrify")
		if (!option)
			return
		if(option == "Open/Close")
			if(user.psi && !user.psi.suppressed && user.psi.get_rank(PSI_METAKINESIS) <= PSI_RANK_OPERANT)
				if(prob(30))
					to_chat("<span class='warning'>�� ��������� ��� �������� �������� � [D.name], �� ������ �� ����������!</span>")
					user.visible_message("<span class='notice'>[user] ��������� ��� ������� �������� � [D.name] � �����������.</span>")
					return
			if(D && AIRLOCK_OPEN)
				D.open()
				user.visible_message("<span class='notice'>[user] ������� �������� � [D.name] �����������.</span>")
				new /obj/effect/temporary(get_turf(A),3, 'icons/effects/effects.dmi', "electricity_constant")
				playsound(D.loc, "sparks", 50, 1)
			if(D && AIRLOCK_CLOSED)
				D.close()
				user.visible_message("<span class='notice'>[user] ������� �������� � [D.name] �����������.</span>")
				new /obj/effect/temporary(get_turf(A),3, 'icons/effects/effects.dmi', "electricity_constant")
				playsound(D.loc, "sparks", 50, 1)

		if(option == "Electrify")
			D.electrify(50, 0)
			if(proximity)
				user.visible_message("<span class='warning'>[user] ������������ ���� � ������ [D.name], ��������� ����� �� ����� ����.</span>")
			else
				user.visible_message("<span class='warning'>[user] �������� � [D.name] ������ ����� �������������.</span>")
			new /obj/effect/temporary(get_turf(A),3, 'icons/effects/effects.dmi', "electricity_constant")
			playsound(D.loc, "sparks", 50, 1)

		if(option == "Bolt/Unbolt")
			if(user.psi && !user.psi.suppressed && user.psi.get_rank(PSI_METAKINESIS) >= PSI_RANK_MASTER)
				D.toggle_lock()
				if(proximity)
					user.visible_message("<span class='notice'>[user] ���������� ��� ���� � [D.name], ������� ����� � ��������.</span>")
				else
					user.visible_message("<span class='notice'>[user] ������� ���� � �����, ������� ����� [D.name] � ��������.</span>")
				new /obj/effect/temporary(get_turf(A),3, 'icons/effects/effects.dmi', "electricity_constant")
				playsound(D.loc, "sparks", 50, 1)
			else
				user.visible_message("<span class='notice'>[user] ���������� ��� ���� � [D.name], �� ������ �� ����������.</span>")
				to_chat("<span class='warning'>�� ����������� ���� ���� � [D.name], ������� ���������� ����� ����� ��� ���������� ���������, �� ������ �� ����������!</span>")
				return

	..()

/obj/item/psychic_power/psifire
	name = "orb of eternal flame"
	force = 5
	edge = TRUE
	maintain_cost = 10
	icon_state = "pyro"
	item_state = "pyro"
	attack_cooldown = 5

	var/combat_mode = FALSE
	var/turf/previousturf = null

	var/range = 2
	var/flame_power = 25
	var/flame_color = COLOR_RED

/obj/item/psychic_power/psifire/New(var/mob/living/user)
	var/fire_rank = user.psi.get_rank(PSI_METAKINESIS)

	maintain_cost -= fire_rank
	flame_power += fire_rank
	range += fire_rank

	if(user.psi && !user.psi.suppressed && user.psi.get_rank(PSI_METAKINESIS) >= PSI_RANK_MASTER)
		flame_color = COLOR_BLUE
		flame_power += 5

	..()

/obj/item/psychic_power/psifire/AltClick(mob/user)
	combat_mode = !combat_mode
	if(!combat_mode)
		to_chat(user, "<span class='warning'>�� ������������� � ���. ������, ���� ������� ����� ��������� �����</span>")
	if(combat_mode)
		to_chat(user, "<span class='warning'>�� ����� ������ ��������� ����������� � ����� ������.</span>")

/obj/item/psychic_power/psifire/afterattack(atom/A as mob|obj|turf|area, var/mob/living/user as mob, proximity)
//TURFS

	if(istype(A, /turf/) && !proximity)
		var/turf/target_turf = get_turf(A)
		if(target_turf)
			var/turflist = getline(user, target_turf)
			flame_turf(turflist)
			user.visible_message("<span class='danger'>[user] ���������� �����, �������� ����� �� ����!</span>")

	else if(!proximity)
		return

//OTHER STUFF

	var/obj/OBJ = A
	if(istype(OBJ))
		if(istype(A, /obj/item/clothing/mask/smokable/cigarette))
			var/obj/item/clothing/mask/smokable/cigarette/S = A
			S.light("[user] ������� �������� ��� ����������, ���������� [S.name].")
			playsound(S.loc, "light_bic", 100, 1, -4)
		else
			user.visible_message("<span class='warning'>[user] ���������� ���� � [OBJ]. ����� ��������, ��� �� ����� ��������������� ��� ���.</span>")
			OBJ.HandleObjectHeating(src, user, 700)

//MOBS

	if(istype(A, /mob/living) && combat_mode)
		var/mob/living/target = A
		user.visible_message("<span class='danger'>[user] ���������� ���� � [target], ������� ��� ��� ������!</span>")
		target.fire_act(exposed_temperature = 300, exposed_volume = 250)
	else if(istype(A, /mob/living))
		var/mob/living/target = A
		if(istype(target.wear_mask, /obj/item/clothing/mask/smokable/cigarette) && user.zone_sel.selecting == BP_MOUTH)
			var/obj/item/clothing/mask/smokable/cigarette/cig = target.wear_mask
			if(target == user)
				cig.attackby(src, user)
			else
				cig.light("<span class='notice'>[user] ������� �������� ��� ����������, ���������� [cig.name] �� ��� [target].</span>")

/obj/item/psychic_power/psifire/proc/flame_turf(list/turflist)
	var/length = LAZYLEN(turflist)
	if(length < 1)
		return
	turflist.len = min(length, range)

	playsound(src, pick('sound/weapons/guns/flamethrower1.ogg','sound/weapons/guns/flamethrower2.ogg','sound/weapons/guns/flamethrower3.ogg' ), 50, TRUE, -3)

	for(var/turf/T in turflist)
		if(T.density || istype(T, /turf/space))
			break
		if(!previousturf && length(turflist)>1)
			previousturf = get_turf(src)
			continue	//so we don't burn the tile we be standin on
		if(previousturf && (!T.CanPass(null, previousturf, 0,0) || !previousturf.CanPass(null, T, 0,0)))
			break
		previousturf = T

		//Consume part of our fuel to create a fire spot
		var/obj/effect/turf_fire/TF = T.IgniteTurf(flame_power, flame_color)
		if(istype(TF))
			TF.interact_with_atmos = FALSE
		T.hotspot_expose((flame_power * 3) + 300, 50)
		sleep(1)
	previousturf = null