//Mantidified objects

#define MATERIAL_STEEL_A                   "steеl"

/material/steel/ascent
	name = MATERIAL_STEEL_A
	icon_colour = COLOR_GRAY40

/obj/structure/table/steel_reinforced/ascent
	material = MATERIAL_STEEL_A

/obj/structure/table/rack/ascent
	color = COLOR_GRAY40
	material = MATERIAL_STEEL_A

/obj/structure/table/rack/ascent/on_update_icon()
	color = COLOR_GRAY40
	alpha = 255

/obj/item/mop/advanced/ascent
	name = "deck detritus delaminator"
	desc = "An alien staff with spongy filaments on one end."
	icon = 'icons/obj/ascent_doodads.dmi'
	item_state = "advmop"

/obj/item/reagent_containers/glass/bucket/ascent
	name = "portable liquid cleaning agent carrier"
	desc = "An alien container of some sort."
	icon = 'icons/obj/ascent_doodads.dmi'
	item_state = "bucket"

/obj/structure/mopbucket/ascent
	name = "portable liquid cleaning agent holder"
	desc = "An alien container of some sort."
	icon = 'icons/obj/ascent_doodads.dmi'

/obj/item/material/knife/kitchen/cleaver/ascent
	name = "xenobiological flenser"
	desc = "A mindboggingly alien tool for flensing flesh."
	icon = 'icons/obj/ascent_doodads.dmi'
	icon_state = "xenobutch"

	slot_flags = SLOT_DENYPOCKET | SLOT_HOLSTER | SLOT_BELT

/obj/structure/closet/crate/freezer/meat/ascent
	name = "cryogenic stasis unit"
	desc = "A bizarre alien stasis unit."
	icon = 'icons/obj/ascent_doodads.dmi'
	closet_appearance = /decl/closet_appearance/crate/freezer/ascent

/obj/item/reagent_containers/food/drinks/cans/waterbottle/ascent
	name = "hydration cylinder"
	desc = "An alien portable long term storage device for potable water."
	icon = 'icons/obj/ascent_doodads.dmi'

/obj/item/reagent_containers/food/snacks/hydration
	name = "hydration ration"
	desc = "Approximately ten units of liquid hydration in a edible membrane. Unflavored."
	icon = 'icons/obj/ascent_doodads.dmi'
	icon_state = "h2o_ration"
	bitesize = 10
/obj/item/reagent_containers/food/snacks/hydration/Initialize()
	.=..()
	reagents.add_reagent(/datum/reagent/water, 10)

/obj/item/storage/box/water/ascent
	name = "box of hydration cylinders"
	desc = "A box full of bottled water."
	icon = 'icons/obj/ascent_doodads.dmi'
	icon_state = "box"
	startswith = list(/obj/item/reagent_containers/food/drinks/cans/waterbottle/ascent = 7)

/obj/structure/hygiene/shower/ascent
	name = "hydrating decontamination armature"
	desc = "An alien vertical squirt bath."
	icon = 'icons/obj/ascent_doodads.dmi'

/obj/structure/hygiene/sink/ascent
	name = "hydration outlet"
	desc = "An alien wall mounted basin with mysterious protrusions."
	icon = 'icons/obj/ascent_doodads.dmi'

/obj/structure/reagent_dispensers/water_cooler/ascent
	name = "hydration dispensator"
	desc = "An alien device housing liquid for alien purposes."
	icon = 'icons/obj/ascent_doodads.dmi'
	cups = 50
	cup_type = /obj/item/reagent_containers/food/snacks/hydration

/obj/structure/reagent_dispensers/water_cooler/ascent/DispenserMessages(var/mob/user)
	return list("\The [user] grabs a hydration ration orb from \the [src].", "You grab a hydration ration orb from \the [src].")

/obj/structure/reagent_dispensers/water_cooler/ascent/RejectionMessage(var/mob/user)
	return "\The [src]'s orb supply is empty. Notify a control mind."
