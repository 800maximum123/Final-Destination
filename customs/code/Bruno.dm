/obj/item/material/knife/kitchen/plasteelchefknife
	name = "plasteel knife"
	icon = 'customs/icons/obj/plasteelchefknife.dmi'
	icon_state = "plasteelchefknife"
	desc = "Knife made of Damascus plasteel. Has a gold engraving A.L. on the blade."
	applies_material_name = FALSE

/obj/item/clothing/suit/storage/toggle/labcoat/institutecoat
	name = "institute coat"
	desc = "Green trench coat with Cuchulain's Institute of Science patch on the shoulder. Made from expensive materials."
	icon = 'icons/fd/mob/onmob_suit.dmi'
	icon_state = "institutecoat"
	item_icons = list(
		slot_wear_suit_str = 'icons/fd/mob/onmob_suit.dmi')

/obj/item/clothing/glasses/broken_glasses
	name = "broken glasses"
	desc = "Broken glasses. They are carefully wrapped with tape."
	icon = 'customs/icons/obj/broken_glasses1.DMI'
	icon_state = "broken_glasses"
	item_icons = list(
		slot_wear_eyes_str = 'customs/icons/mob/broken_glasses.DMI')

/obj/item/clothing/accessory/oversize_jacket
    name = "oversize jacket"
    desc = "Quite a large jacket made of lightweight, breathable material. It is quite old, but has clearly been well cared for. The jacket smells like carnation."
    icon = 'customs/icons/mob/oversize_jacket.dmi'
    icon_state = "oversize_jacket"
    item_icons = list(
        slot_wear_suit_str = 'customs/icons/mob/oversize_jacket.dmi')

    var/obj/item/storage/internal/container
    var/max_w_class = ITEM_SIZE_SMALL
    var/slots = 2 STORAGE_FREEFORM

    slot = ACCESSORY_SLOT_INSIGNIA
    slot_flags = SLOT_OCLOTHING

/obj/item/clothing/accessory/oversize_jacket/Initialize()
    . = ..()
    if (. == INITIALIZE_HINT_QDEL)
        return
    if (!slots)
        . = INITIALIZE_HINT_QDEL
        crash_with("[type] created with no slots")
    if (slots < 0)
        container = new /obj/item/storage/internal/pouch (src, (-slots) * BASE_STORAGE_COST(max_w_class))
    else
        container = new /obj/item/storage/internal/pockets (src, slots, max_w_class)


/obj/item/clothing/accessory/oversize_jacket/attack_hand(mob/user)
    if (container)
        if (parent)
            container.open(user)
        else if (container.handle_attack_hand(user))
            ..(user)


/obj/item/clothing/accessory/oversize_jacket/MouseDrop(obj/over_object)
    if (!parent && container?.handle_mousedrop(usr, over_object))
        ..(over_object)


/obj/item/clothing/accessory/oversize_jacket/attackby(obj/item/I, mob/user)
    if (container)
        return container.attackby(I, user)


/obj/item/clothing/accessory/oversize_jacket/emp_act(severity)
    if (container)
        container.emp_act(severity)
    ..()
/obj/item/clothing/accessory/oversize_jacket/attack_self(mob/user)
    add_fingerprint(user)
    if (!container)
        return
    container.hide_from(user)
    var/count = 0
    var/turf/T = get_turf(src)
    for (var/obj/item/I in container)
        container.remove_from_storage(I, T, TRUE)
        ++count
    if (!count)
        to_chat(user, "\The [src] is empty.")
        return
    container.finish_bulk_removal()
    visible_message("\The [user] empties \the [src].", range = 5)