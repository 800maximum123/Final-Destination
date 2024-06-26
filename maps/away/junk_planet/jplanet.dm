//SEV MAGNUS CRASHSITE

/obj/effect/overmap/visitable/sector/junk_planet
	name = "Planet sector 1"
	desc = "Scans indicate an emergency signal broadcasting SCG codes, coming somewhere from this sector."
	sector_flags = OVERMAP_SECTOR_KNOWN
	icon_state = "junk_planet1"
	initial_generic_waypoints = list(
		"nav_jplanet_1",
		"nav_jplanet_2",
		"nav_jplanet_3"
	)

/obj/effect/overmap/visitable/sector/junk_planet/on_update_icon()
	return

/datum/map_template/ruin/away_site/junk_planet
	name = "Planet sector 1"
	id = "awaysite_jplanet"
	spawn_cost = 1000 //NO BITCHES??
	player_cost = 2
	description = "Sector with SEV Magnus crashsite. For events only."
	suffixes = list("junk_planet/jplanet-1.dmm")
	area_usage_test_exempted_root_areas = list(/area/jplanet/)
	apc_test_exempt_areas = list(
		/area/jplanet/outdoors = NO_SCRUBBER|NO_VENT|NO_APC
	)

/obj/effect/shuttle_landmark/nav_jplanet/nav1
	name = "Beach Landing Point #1"
	landmark_tag = "nav_jplanet_1"
	base_area = /area/jplanet/outdoors

/obj/effect/shuttle_landmark/nav_jplanet/nav2
	name = "Beach Landing Point #2"
	landmark_tag = "nav_jplanet_2"
	base_area = /area/jplanet/outdoors

/obj/effect/shuttle_landmark/nav_jplanet/nav3
	name = "Beach Landing Point #3"
	landmark_tag = "nav_jplanet_3"
	base_area = /area/jplanet/outdoors

//JUNGLE

/obj/effect/overmap/visitable/sector/junk_planet_jungle1
	name = "Planet sector 2"
	desc = "Sensor array detects an lush sector with alot of fauna."
	sector_flags = OVERMAP_SECTOR_KNOWN
	icon_state = "junk_planet"
	initial_generic_waypoints = list(
		"nav_jplanet2_1",
		"nav_jplanet2_2",
		"nav_jplanet2_3"
	)

/obj/effect/overmap/visitable/sector/junk_planet_jungle1/on_update_icon()
	return

/datum/map_template/ruin/away_site/junk_planet_jungle1
	name = "Planet sector 2"
	id = "awaysite_jplanet2"
	spawn_cost = 1000 //NO BITCHES??
	player_cost = 2
	description = "Lush sector with alot of fauna."
	suffixes = list("junk_planet/jplanet-2.dmm")
	area_usage_test_exempted_root_areas = list(/area/jplanet/)
	apc_test_exempt_areas = list(
		/area/jplanet/outdoors = NO_SCRUBBER|NO_VENT|NO_APC
	)

/obj/effect/shuttle_landmark/nav_jplanet2/nav1
	name = "Jungle Landing Point #1"
	landmark_tag = "nav_jplanet2_1"
	base_area = /area/jplanet/outdoors

/obj/effect/shuttle_landmark/nav_jplanet2/nav2
	name = "Jungle Landing Point #2"
	landmark_tag = "nav_jplanet2_2"
	base_area = /area/jplanet/outdoors

/obj/effect/shuttle_landmark/nav_jplanet2/nav3
	name = "Jungle Landing Point #3"
	landmark_tag = "nav_jplanet2_3"
	base_area = /area/jplanet/outdoors


//PROPS AND ETC

/area/jplanet/outdoors
	name = "Junk Planet"
	icon_state = "centcom"
	dynamic_lighting = 1
	ambience = list('sound/ambience/fd/shore.ogg', 'sound/ambience/fd/jungle.ogg')
	base_turf = /turf/unsimulated/floor/exoplanet/desert

/area/jplanet/indoors
	name = "Junk Planet Indoors"
	icon_state = "centcom"
	dynamic_lighting = 1
	base_turf = /turf/unsimulated/floor/exoplanet/barren

/area/jplanet/outdoors/water
	name = "Junk Planet Ocean"
	ambience = list('sound/ambience/fd/shore.ogg')
	base_turf = /turf/unsimulated/floor/exoplanet/water/shallow

/obj/structure/fd/scorched
	name = "Scorched body"
	desc = "Something turned this man into literal ash sculpture"
	icon = 'icons/fd/structures/Leftovers.dmi'
	icon_state = "Loner2"
	density = TRUE
	anchored = TRUE

/obj/structure/fd/scorched/attack_hand(mob/user as mob)
	to_chat(user, "<span class='notice'>[src] sinks together into a pile of ash.</span>")
	var/turf/simulated/floor/F = get_turf(src)
	if (istype(F))
		new /obj/effect/decal/cleanable/ash(F)
	qdel(src)

//�����

/obj/structure/flora/tree/jungle
	icon = 'icons/fd/structures/jungletree.dmi'
	icon_state = "tree1"
	pixel_x = -50
	pixel_y = -25

/obj/structure/flora/tree/jungle/New()
	..()
	icon_state = "tree[rand(1, 6)]"

/obj/structure/flora/tree/jungle/small
	icon = 'icons/fd/structures/jungletreesmall.dmi'
	icon_state = "tree1"
	pixel_x = -32
	pixel_y = 0

/obj/structure/flora/jungle
	anchored = TRUE

/obj/structure/flora/jungle/bush
	name = "bush"
	icon = 'icons/fd/structures/largejungleflora.dmi'
	icon_state = "bush1"
	pixel_x = -16

/obj/structure/flora/jungle/bush/New()
	..()
	icon_state = "bush[rand(1, 3)]"

/obj/structure/flora/tree/tropic
	icon = 'icons/fd/structures/cm/joshuatree.dmi'
	icon_state = "joshua_2"

/obj/structure/flora/tree/tropic/New()
	..()
	icon_state = "joshua_[rand(1, 4)]"

/obj/structure/flora/tropic
	anchored = TRUE

/obj/structure/flora/tropic/rock
	name = "rock"
	icon_state = "brown_1"
	density = TRUE
	icon = 'icons/fd/structures/cm/rocks.dmi'

/obj/structure/flora/tropic/rock/New()
	..()
	icon_state = "brown_[rand(1, 2)]"

/obj/structure/flora/tropic/small_tree
	name = "small tropical tree"
	icon_state = "tree_1"
	icon = 'icons/fd/structures/cm/dam.dmi'

/obj/structure/flora/tropic/small_tree/New()
	..()
	icon_state = "tree_[rand(1, 2)]"

/obj/structure/flora/tropic/small_tree/orange
	icon_state = "tree_3"
	icon = 'icons/fd/structures/cm/dam.dmi'

/obj/structure/flora/tropic/small_tree/orange/New()
	..()
	icon_state = "tree_[rand(3, 4)]"

/obj/structure/flora/tropic/cactus
	name = "cactus"
	icon_state = "cactus_4"
	icon = 'icons/fd/structures/cm/dam.dmi'

/obj/structure/flora/tropic/cactus/New()
	..()
	icon_state = "cactus_[rand(1, 4)]"

/obj/structure/flora/tropic/cactus/alt
	icon_state = "cacti_8"
	icon = 'icons/fd/structures/cm/dam.dmi'

/obj/structure/flora/tropic/cactus/alt/New()
	..()
	icon_state = "cacti_[rand(1, 4)]"

//�������� �����



//�����

/mob/living/simple_animal/hostile/smart_beast/rain_world/crab
	name = "junkrab"
	desc = "A fast, armoured predator accustomed to hiding and ambushing in jungles."
	faction = "crab"
	icon_state = "shantak-alt"
	icon_living = "shantak-alt"
	icon_dead = "shantak-alt_dead"
	maxHealth = 125
	health = 125
	diet = DIET_CARNIVOROUS
	mob_bump_flag = HUMAN
	mob_swap_flags = HUMAN|SIMPLE_ANIMAL|SLIME|MONKEY
	mob_push_flags = ALLMOBS
	mob_size = MOB_MEDIUM
	melee_attack_delay = 6
	movement_cooldown = 1
	natural_weapon = /obj/item/natural_weapon/pincers/giant
	natural_armor = list(
		melee = ARMOR_MELEE_RESISTANT,
		bullet = ARMOR_BALLISTIC_PISTOL
		)
	ai_holder = /datum/ai_holder/smart_animal/rain_world/carnivore_placeholder
	say_list_type = /datum/say_list/smart/shantak
	flash_vulnerability = 0

	aggression_affects_hostility = FALSE
	hunger_affects_hostility = FALSE
	respect_stats = TRUE

	attack_sound = null
	movement_sound = null			// If set, will play this sound when it moves on its own will.
	turn_sound = null				// If set, plays the sound when the mob's dir changes in most cases.

/mob/living/simple_animal/hostile/smart_beast/rain_world/crab/attack_hand(mob/living/carbon/C)
	. = ..()
	reflect_unarmed_damage(C, BRUTE, "armoured carapace")