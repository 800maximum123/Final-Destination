// Note about emote messages:
// - USER / TARGET will be replaced with the relevant name, in bold.
// - USER_THEM / TARGET_THEM / USER_THEIR / TARGET_THEIR will be replaced with a
//   gender-appropriate version of the same.
// - Impaired messages do not do any substitutions.

/decl/emote

	var/key                            // Command to use emote ie. '*[key]'
	var/emote_message_1p               // First person message ('You do a flip!')
	var/emote_message_3p               // Third person message ('Urist McShitter does a flip!')
	var/emote_message_impaired         // Deaf/blind message ('You hear someone flipping out.', 'You see someone opening and closing their mouth')

	var/emote_message_1p_target        // 'You do a flip at Urist McTarget!'
	var/emote_message_3p_target        // 'Urist McShitter does a flip at Urist McTarget!'

	var/list/emote_sound = null
	// three-dimensional array
	// first is the species, associated to a list of genders, associated to a list of the sound effects to use
	var/list/sounded_species = null

	var/message_type = VISIBLE_MESSAGE // Audible/visual flag
	var/targetted_emote                // Whether or not this emote needs a target.
	var/check_restraints               // Can this emote be used while restrained?
	var/check_range                    // falsy, or a range outside which the emote will not work
	var/conscious = TRUE               // Do we need to be awake to emote this?
	var/emote_range                    // falsy, or a range outside which the emote is not shown

/decl/emote/proc/get_emote_message_1p(var/atom/user, var/atom/target, var/extra_params)
	if(target)
		return emote_message_1p_target
	return emote_message_1p

/decl/emote/proc/get_emote_message_3p(var/atom/user, var/atom/target, var/extra_params)
	if(target)
		return emote_message_3p_target
	return emote_message_3p

/decl/emote/proc/do_emote(var/atom/user, var/extra_params)

	if(ismob(user) && check_restraints)
		var/mob/M = user
		if(M.restrained())
			to_chat(user, "<span class='warning'>You are restrained and cannot do that.</span>")
			return

	var/atom/target
	if(can_target() && extra_params)
		extra_params = lowertext(extra_params)
		for(var/atom/thing in view(user))
			if(extra_params == lowertext(thing.name))
				target = thing
				break

	if (targetted_emote && !target)
		to_chat(user, SPAN_WARNING("You can't do that to thin air."))
		return

	if (target && target != user && check_range)
		if (get_dist(user, target) > check_range)
			to_chat(user, SPAN_WARNING("\The [target] is too far away."))
			return

	var/datum/gender/user_gender = gender_datums[user.get_visible_gender()]
	var/datum/gender/target_gender
	if(target)
		target_gender = gender_datums[target.get_visible_gender()]

	var/use_3p
	var/use_1p
	if(emote_message_1p)
		if(target && emote_message_1p_target)
			use_1p = get_emote_message_1p(user, target, extra_params)
			use_1p = replacetext_char(use_1p, "TARGET_THEM", target_gender.him)
			use_1p = replacetext_char(use_1p, "TARGET_THEIR", target_gender.his)
			use_1p = replacetext_char(use_1p, "TARGET_SELF", target_gender.self)
			use_1p = replacetext_char(use_1p, "TARGET", "<b>\the [target]</b>")
		else
			use_1p = get_emote_message_1p(user, null, extra_params)
		use_1p = capitalize(use_1p)

	if(emote_message_3p)
		if(target && emote_message_3p_target)
			use_3p = get_emote_message_3p(user, target, extra_params)
			use_3p = replacetext_char(use_3p, "TARGET_THEM", target_gender.him)
			use_3p = replacetext_char(use_3p, "TARGET_THEIR", target_gender.his)
			use_3p = replacetext_char(use_3p, "TARGET_SELF", target_gender.self)
			use_3p = replacetext_char(use_3p, "TARGET", "<b>\the [target]</b>")
		else
			use_3p = get_emote_message_3p(user, null, extra_params)
		use_3p = replacetext_char(use_3p, "USER_THEM", user_gender.him)
		use_3p = replacetext_char(use_3p, "USER_THEIR", user_gender.his)
		use_3p = replacetext_char(use_3p, "USER_SELF", user_gender.self)
		use_3p = replacetext_char(use_3p, "USER", "<b>\the [user]</b>")
		use_3p = capitalize(use_3p)

	var/use_range = emote_range
	if (!use_range)
		use_range = world.view

	if(ismob(user))
		var/mob/M = user
		if(message_type == AUDIBLE_MESSAGE)
			M.audible_message(message = use_3p, self_message = use_1p, deaf_message = emote_message_impaired, hearing_distance = use_range, checkghosts = /datum/client_preference/ghost_sight)
		else
			M.visible_message(message = use_3p, self_message = use_1p, blind_message = emote_message_impaired, range = use_range, checkghosts = /datum/client_preference/ghost_sight)
		var/list/listening = list()
		var/list/listening_obj = list()
		get_mobs_and_objs_in_view_fast(get_turf(M), use_range, listening, listening_obj, /datum/client_preference/ghost_ears)
		var/list/speech_bubble_recipients = list()
		for(var/mob/MM in listening)
			if(MM)
				if(MM.client)
					speech_bubble_recipients += MM.client
		var/we_have_the = findtext(use_3p,"The",1,length(use_3p)/1.5)
		INVOKE_ASYNC(M, /atom/movable/proc/animate_chat, copytext_char(use_3p, length(M.name) + (we_have_the ? 13 : 9), length(use_3p)), all_languages["Noise"], TRUE, speech_bubble_recipients)

	do_extra(user, target)

/decl/emote/proc/do_extra(var/atom/user, var/atom/target)
	return

/decl/emote/proc/check_user(var/atom/user)
	return TRUE

/decl/emote/proc/can_target()
	return (emote_message_1p_target || emote_message_3p_target)

/decl/emote/dd_SortValue()
	return key

/decl/emote/do_emote(var/atom/user, var/extra_params)
	..()
	if(emote_sound) do_sound(user)

/decl/emote/proc/do_sound(var/atom/user)
	var/mob/living/carbon/human/H = user
	if(H.stat) return // No dead or unconcious people screaming pls.
	if(istype(H))
		if(sounded_species)
			if(H.species.name in sounded_species)
				if(islist(emote_sound))
					if(H.species.name == SPECIES_SKRELL)
						if(H.h_style == "Skrell Male Tentacles")
							return playsound(user.loc, pick(emote_sound[MALE]), 50, 0)
						else
							return playsound(user.loc, pick(emote_sound[FEMALE]), 50, 0)
					if(emote_sound[H.gender])
						return playsound(user.loc, pick(emote_sound[H.gender]), 50, 0)
		return playsound(user.loc, pick(emote_sound), 50, 0)
