/obj/item/psychic_power/psielectro
	name = "orb of energy"
	force = 5
	sharp = TRUE
	edge = TRUE
	maintain_cost = 5
	icon_state = "electro"
	item_state = "electro"
	attack_cooldown = 10

/obj/item/psychic_power/psielectro/afterattack(atom/A as mob|obj|turf|area, var/mob/living/carbon/user as mob, proximity)

//AIRLOCKS

	if(istype(A,/obj/machinery/door/airlock))
		var/obj/machinery/door/airlock/D = A
		var/option = input(user, "Do something!", "What do you want to do?") in list("Open/Close", "Bolt It", "Electrify")
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
			user.visible_message("<span class='warning'>[user] ������������ ���� � ������ [D.name], ��������� ����� �� ����� ����.</span>")
			new /obj/effect/temporary(get_turf(A),3, 'icons/effects/effects.dmi', "electricity_constant")
			playsound(D.loc, "sparks", 50, 1)

		if(option == "Bolt It")
			if(user.psi && !user.psi.suppressed && user.psi.get_rank(PSI_METAKINESIS) >= PSI_RANK_MASTER)
				D.toggle_lock()
				user.visible_message("<span class='notice'>[user] ���������� ��� ���� � [D.name], ������� ����� � �������� ���������.</span>")
				new /obj/effect/temporary(get_turf(A),3, 'icons/effects/effects.dmi', "electricity_constant")
				playsound(D.loc, "sparks", 50, 1)
			else
				user.visible_message("<span class='notice'>[user] ���������� ��� ���� � [D.name], �� ������ �� ����������.</span>")
				to_chat("<span class='warning'>�� ����������� ���� ���� � [D.name], ������� ���������� ����� ����� ��� ���������� ���������, �� ������ �� ����������!</span>")
				return