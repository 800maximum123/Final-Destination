/obj/machinery/vending/npc
	shut_up = 0
	slogan_delay = 10
	use_power = 0
	icon = 'icons/mob/human_races/species/human/npc.dmi'
	icon_state = "preview"

/obj/machinery/vending/attackby(obj/item/W as obj, var/mob/living/user as mob)

	var/obj/item/card/id/I = W.GetIdCard()

	if (currently_vending && vendor_account && !vendor_account.suspended)
		var/paid = 0
		var/handled = 0

		if (I) //for IDs and PDAs and wallets with IDs
			paid = pay_with_card(I,W)
			handled = 1
		else if (istype(W, /obj/item/spacecash/ewallet))
			var/obj/item/spacecash/ewallet/C = W
			paid = pay_with_ewallet(C)
			handled = 1
		else if (istype(W, /obj/item/spacecash/bundle))
			var/obj/item/spacecash/bundle/C = W
			paid = pay_with_cash(C)
			handled = 1

		if(paid)
			src.vend(currently_vending, usr)
			return TRUE
		else if(handled)
			SSnano.update_uis(src)
			return TRUE // don't smack that machine with your 2 thalers

	if (I || istype(W, /obj/item/spacecash))
		attack_hand(user)
		return TRUE
	if(istype(W, /obj/item/material/coin) && premium.len > 0)
		if(!user.unEquip(W, src))
			return FALSE
		coin = W
		categories |= CAT_COIN
		to_chat(user, "<span class='notice'>You insert \the [W] into \the [src].</span>")
		SSnano.update_uis(src)
		return TRUE
	if((user.a_intent == I_HELP) && attempt_to_stock(W, user))
		return TRUE
	if((. = component_attackby(W, user)))
		return

/obj/machinery/vending/npc/emag_act()
	return

/obj/machinery/vending/npc/on_update_icon()
	return

/obj/machinery/vending/npc/police
	name = "Policeman"
	desc = "The one who protects you."
	icon_state = "npc_police"
	product_slogans = "Когда уже перерыв...;Интересно, как там дома?;Уже шестое исчезновение за неделю и ни одной зацепки...;Эй! Позовите сюда Майка!;Нужно отнести это дело шефу в офис.;Надеюсь, я успею закончить отчёт до конца смены...не хочу сидеть сверхурочные.;Вечером по пивку, а?;Думаю, стоит сделать перекур.;У кого-нибудь есть лишний листок?;Какой же бардак...;Я так устал...;Мне действительно стоит поговорить с боссом об отпуске, это перебор;Пу-пу-пу-у..."
	product_ads = "Я занят.;Обратитесь ко мне позже.;У вас нет других дел?;Отвалите...;Найдите себе занятие получше.;Ну?;Что вам нужно?;Что вы здесь забыли?"

/obj/machinery/vending/npc/civilian
	name = "Random Citizen"
	desc = "The one who don't like you."

/obj/machinery/vending/npc/civilian/punk
	name = "Street Punk"
	icon_state = "npc_civilian5"
	product_slogans = "Хорошего прикура!;Братан, да у меня лучшее курево в городе!;Что, решил курнуть?;Давай-давай! Никотиновый рай уже заждался тебя!;Кстати, могу посоветовать отличного кальянщика..."
	products = list(
					/obj/item/storage/cigpaper/filters = 5,
					/obj/item/storage/cigpaper = 3,
					/obj/item/storage/cigpaper/fancy = 2,
					/obj/item/storage/chewables/rollable/bad = 2,
					/obj/item/storage/chewables/rollable/generic = 2,
					/obj/item/storage/chewables/rollable/fine = 2,
					/obj/item/storage/fancy/cigarettes = 5,
					/obj/item/storage/fancy/cigarettes/luckystars = 2,
					/obj/item/storage/fancy/cigarettes/jerichos = 2,
					/obj/item/storage/fancy/cigarettes/menthols = 2,
					/obj/item/storage/fancy/cigarettes/carcinomas = 2,
					/obj/item/storage/fancy/cigarettes/professionals = 2,
					/obj/item/storage/fancy/cigarettes/cigarello = 2,
					/obj/item/storage/fancy/cigarettes/cigarello/mint = 2,
					/obj/item/storage/fancy/cigarettes/cigarello/variety = 2,
					/obj/item/storage/box/matches = 10,
					/obj/item/flame/lighter/random = 4,
					/obj/item/storage/chewables/tobacco = 2,
					/obj/item/storage/chewables/tobacco2 = 2,
					/obj/item/storage/chewables/tobacco3 = 2,
					/obj/item/clothing/mask/smokable/ecig/simple = 10,
					/obj/item/clothing/mask/smokable/ecig/util = 5,
					/obj/item/clothing/mask/smokable/ecig/deluxe = 1,
					/obj/item/reagent_containers/ecig_cartridge/med_nicotine = 10,
					/obj/item/reagent_containers/ecig_cartridge/high_nicotine = 5,
					/obj/item/reagent_containers/ecig_cartridge/orange = 5,
					/obj/item/reagent_containers/ecig_cartridge/mint = 5,
					/obj/item/reagent_containers/ecig_cartridge/watermelon = 5,
					/obj/item/reagent_containers/ecig_cartridge/grape = 5,
					/obj/item/reagent_containers/ecig_cartridge/lemonlime = 5,
					/obj/item/reagent_containers/ecig_cartridge/coffee = 5,
					/obj/item/reagent_containers/ecig_cartridge/blanknico = 2,
					/obj/item/flame/lighter/zippo = 4,
					/obj/item/storage/fancy/cigar = 5)

	prices = list(
					/obj/item/flame/lighter/zippo = 80,
					/obj/item/storage/fancy/cigar = 50,
					/obj/item/storage/chewables/tobacco = 40,
					/obj/item/storage/chewables/tobacco2 = 50,
					/obj/item/storage/chewables/tobacco3 = 60,
					/obj/item/storage/cigpaper/filters = 5,
					/obj/item/storage/cigpaper = 8,
					/obj/item/storage/cigpaper/fancy = 12,
					/obj/item/storage/chewables/rollable/bad = 20,
					/obj/item/storage/chewables/rollable/generic = 40,
					/obj/item/storage/chewables/rollable/fine = 60,
					/obj/item/storage/fancy/cigarettes = 45,
					/obj/item/storage/fancy/cigarettes/luckystars = 50,
					/obj/item/storage/fancy/cigarettes/jerichos = 65,
					/obj/item/storage/fancy/cigarettes/menthols = 55,
					/obj/item/storage/fancy/cigarettes/carcinomas = 65,
					/obj/item/storage/fancy/cigarettes/professionals = 70,
					/obj/item/storage/fancy/cigarettes/cigarello = 85,
					/obj/item/storage/fancy/cigarettes/cigarello/mint = 85,
					/obj/item/storage/fancy/cigarettes/cigarello/variety = 85,
					/obj/item/storage/box/matches = 2,
					/obj/item/flame/lighter/random = 5,
					/obj/item/clothing/mask/smokable/ecig/simple = 50,
					/obj/item/clothing/mask/smokable/ecig/util = 100,
					/obj/item/clothing/mask/smokable/ecig/deluxe = 250,
					/obj/item/reagent_containers/ecig_cartridge/med_nicotine = 15,
					/obj/item/reagent_containers/ecig_cartridge/high_nicotine = 15,
					/obj/item/reagent_containers/ecig_cartridge/orange = 15,
					/obj/item/reagent_containers/ecig_cartridge/mint = 15,
					/obj/item/reagent_containers/ecig_cartridge/watermelon = 15,
					/obj/item/reagent_containers/ecig_cartridge/grape = 15,
					/obj/item/reagent_containers/ecig_cartridge/lemonlime = 15,
					/obj/item/reagent_containers/ecig_cartridge/coffee = 15,
					/obj/item/reagent_containers/ecig_cartridge/blanknico = 15)

/obj/machinery/vending/npc/civilian/engineer
	name = "Mechanic"
	product_slogans = "Да-да, а теперь проваливай!;Я работаю, не видишь? Бери что нужно и вали.;Гр-р...;Спасибо за покупку, а теперь попрошу покинуть поле моего зрения.;Ага...оставьте деньги на столе."
	slogan_delay = 20
	icon_state = "npc_civilian6"
	products = list(/obj/item/reagent_containers/food/drinks/bottle/oiljug = 6,
					/obj/item/storage/belt/utility = 4,/obj/item/clothing/glasses/meson = 4,/obj/item/clothing/gloves/insulated = 4, /obj/item/screwdriver = 12,
					/obj/item/crowbar = 12,/obj/item/wirecutters = 12,/obj/item/device/multitool = 12,/obj/item/wrench = 12,/obj/item/device/t_scanner = 12,
					/obj/item/cell/standard = 8, /obj/item/weldingtool = 8,/obj/item/clothing/head/welding = 8,
					/obj/item/light/tube = 10,/obj/item/stock_parts/scanning_module = 5,/obj/item/stock_parts/micro_laser = 5,
					/obj/item/stock_parts/matter_bin = 5,/obj/item/stock_parts/manipulator = 5,/obj/item/stock_parts/console_screen = 5,
					/obj/item/stock_parts/capacitor = 5, /obj/item/stock_parts/keyboard = 5, /obj/item/stock_parts/power/apc/buildable = 5,
					/obj/item/cell/high = 5, /obj/item/airlock_electronics = 10, /obj/item/module/power_control = 10, /obj/item/stack/cable_coil = 5)
	prices = list(
					/obj/item/reagent_containers/food/drinks/bottle/oiljug = 20,
					/obj/item/storage/belt/utility = 20,
					/obj/item/clothing/glasses/meson = 100,
					/obj/item/clothing/gloves/insulated = 50,
					/obj/item/screwdriver = 10,
					/obj/item/crowbar = 10,
					/obj/item/wirecutters = 10,
					/obj/item/device/multitool = 100,
					/obj/item/wrench = 10,
					/obj/item/device/t_scanner = 50,
					/obj/item/cell/standard = 50,
					/obj/item/weldingtool = 20,
					/obj/item/clothing/head/welding = 20,
					/obj/item/light/tube = 5,
					/obj/item/stock_parts/scanning_module = 35,
					/obj/item/stock_parts/micro_laser = 50,
					/obj/item/stock_parts/matter_bin = 35,
					/obj/item/stock_parts/console_screen = 35,
					/obj/item/stock_parts/manipulator = 35,
					/obj/item/stock_parts/capacitor = 50,
					/obj/item/stock_parts/keyboard = 15,
					/obj/item/stock_parts/power/apc/buildable = 50,
					/obj/item/cell/high = 100,
					/obj/item/airlock_electronics = 50,
					/obj/item/module/power_control = 50,
					/obj/item/stack/cable_coil = 20)

/obj/machinery/vending/npc/civilian/swordsman
	name = "Swordsman"
	slogan_delay = 20
	icon_state = "npc_civilian2"
	product_slogans = "Надеюсь, вы найдёте ему достойное применение;Прошу, осторожней, эта сталь древнее Терранского Содружества.;Благодарю за покупку.;Хороший выбор.;Надеюсь, это станет отличным дополнением к вашей коллекции."

	products = list(
					/obj/item/fd/fake_melee/halberd = 3,
					/obj/item/fd/fake_melee/sbastard = 3,
					/obj/item/fd/fake_melee/gladius = 3,
					/obj/item/fd/fake_melee/bardiche = 3,
					/obj/item/fd/fake_melee/sabre = 3,
					/obj/item/fd/fake_melee/rapier = 3,
					/obj/item/fd/fake_melee/klevec = 3,
					/obj/item/fd/fake_melee/scimitar = 3)

	prices = list(
					/obj/item/fd/fake_melee/halberd = 100,
					/obj/item/fd/fake_melee/sbastard = 100,
					/obj/item/fd/fake_melee/gladius = 100,
					/obj/item/fd/fake_melee/bardiche = 100,
					/obj/item/fd/fake_melee/sabre = 100,
					/obj/item/fd/fake_melee/rapier = 100,
					/obj/item/fd/fake_melee/klevec = 100,
					/obj/item/fd/fake_melee/scimitar = 100)

/obj/machinery/vending/npc/civilian/clothtrader
	name = "Boutique Owner"
	icon_state = "npc_civilian4"
	slogan_delay = 20
	product_slogans = "Отличный выбор!;Этот костюм будет смотреться на вас просто отлично!;Хорошего вам дня!;Благодарю за покупку!;У вас отличный вкус!"

	products = list(
		/obj/item/clothing/under/color = 3,
		/obj/item/clothing/under/shortjumpskirt = 3,
		/obj/item/clothing/under/color/blackjumpshorts = 3,
		/obj/item/clothing/under/sl_suit = 3,
		/obj/item/clothing/under/suit_jacket = 3,
		/obj/item/clothing/under/suit_jacket/burgundy = 3,
		/obj/item/clothing/under/suit_jacket/charcoal = 3,
		/obj/item/clothing/under/suit_jacket/checkered = 3,
		/obj/item/clothing/under/suit_jacket/really_black = 3,
		/obj/item/clothing/under/suit_jacket/female = 3,
		/obj/item/clothing/under/gentlesuit = 3,
		/obj/item/clothing/under/suit_jacket/navy = 3,
		/obj/item/clothing/under/lawyer/oldman = 3,
		/obj/item/clothing/under/lawyer/purpsuit = 3,
		/obj/item/clothing/under/suit_jacket/red = 3,
		/obj/item/clothing/under/lawyer/red = 3,
		/obj/item/clothing/under/lawyer/black = 3,
		/obj/item/clothing/under/suit_jacket/tan = 3,
		/obj/item/clothing/under/scratch = 3,
		/obj/item/clothing/under/lawyer/bluesuit = 3,
		/obj/item/clothing/under/blazer = 3,
		/obj/item/clothing/under/blackjumpskirt = 3,
		/obj/item/clothing/under/kilt = 3,
		/obj/item/clothing/under/sundress_white = 3,
		/obj/item/clothing/under/dress/dress_fire = 3,
		/obj/item/clothing/under/dress/dress_green = 3,
		/obj/item/clothing/under/dress/dress_orange = 3,
		/obj/item/clothing/under/dress/dress_pink = 3,
		/obj/item/clothing/under/dress/dress_purple = 3,
		/obj/item/clothing/under/sundress = 3,
		/obj/item/clothing/suit/storage/toggle/hoodie/cti = 3,
		/obj/item/clothing/suit/storage/toggle/hoodie/mu = 3,
		/obj/item/clothing/suit/storage/toggle/hoodie/nt = 3,
		/obj/item/clothing/suit/storage/toggle/hoodie/smw = 3,
		/obj/item/clothing/suit/storage/toggle/bomber = 3,
		/obj/item/clothing/suit/storage/leather_jacket/nanotrasen = 3,
		/obj/item/clothing/suit/storage/toggle/brown_jacket/nanotrasen = 3,
		/obj/item/clothing/suit/storage/leather_jacket = 3,
		/obj/item/clothing/suit/storage/toggle/brown_jacket = 3,
		/obj/item/clothing/suit/storage/mbill = 3,
		/obj/item/clothing/glasses/green = 3,
		/obj/item/clothing/glasses/hipster = 3,
		/obj/item/clothing/glasses/sunglasses = 3,
		/obj/item/clothing/glasses/aviators_black = 3,
		/obj/item/clothing/glasses/aviators_silver = 3,
		/obj/item/clothing/glasses/aviators_gold = 3,
		/obj/item/clothing/glasses/aviators_rose = 3,
		/obj/item/clothing/shoes/jackboots = 3,
		/obj/item/clothing/shoes/workboots = 3,
		/obj/item/clothing/shoes/dutyboots = 3,
		/obj/item/clothing/shoes/jungleboots = 3,
		/obj/item/clothing/shoes/desertboots = 3,
		/obj/item/clothing/shoes/black = 3,
		/obj/item/clothing/shoes/blue = 3,
		/obj/item/clothing/shoes/brown = 3,
		/obj/item/clothing/shoes/laceup = 3,
		/obj/item/clothing/shoes/dress/white = 3,
		/obj/item/clothing/shoes/green = 3,
		/obj/item/clothing/shoes/leather = 3,
		/obj/item/clothing/shoes/orange = 3,
		/obj/item/clothing/shoes/purple = 3,
		/obj/item/clothing/shoes/rainbow = 3,
		/obj/item/clothing/shoes/red = 3,
		/obj/item/clothing/shoes/white = 3,
		/obj/item/clothing/shoes/yellow = 3,
		/obj/item/clothing/gloves/color/evening = 3,
		/obj/item/clothing/head/soft/black = 3,
		/obj/item/clothing/head/soft/blue = 3,
		/obj/item/clothing/head/soft/green = 3,
		/obj/item/clothing/head/soft/grey = 3,
		/obj/item/clothing/head/mailman = 3,
		/obj/item/clothing/head/soft/orange = 3,
		/obj/item/clothing/head/soft/purple = 3,
		/obj/item/clothing/head/soft/rainbow = 3,
		/obj/item/clothing/head/soft/red = 3,
		/obj/item/clothing/head/soft/mime = 3,
		/obj/item/clothing/head/soft/yellow = 3,
		/obj/item/clothing/head/hairflower = 3,
		/obj/item/clothing/head/hairflower/blue = 3,
		/obj/item/clothing/head/hairflower/pink = 3,
		/obj/item/clothing/head/hairflower/yellow = 3,
		/obj/item/clothing/head/boaterhat = 3,
		/obj/item/clothing/head/bowler = 3,
		/obj/item/clothing/head/fedora = 3,
		/obj/item/clothing/head/feathertrilby = 3,
		/obj/item/clothing/head/fez = 3,
		/obj/item/clothing/head/that = 3,
		/obj/item/clothing/head/det = 3,
		/obj/item/clothing/head/det/grey = 3,
		/obj/item/clothing/head/panama = 3
	)
	prices = list(
		/obj/item/clothing/under/color = 30,
		/obj/item/clothing/under/shortjumpskirt = 30,
		/obj/item/clothing/under/color/blackjumpshorts = 30,
		/obj/item/clothing/under/sl_suit = 30,
		/obj/item/clothing/under/suit_jacket = 30,
		/obj/item/clothing/under/suit_jacket/burgundy = 30,
		/obj/item/clothing/under/suit_jacket/charcoal = 30,
		/obj/item/clothing/under/suit_jacket/checkered = 30,
		/obj/item/clothing/under/suit_jacket/really_black = 30,
		/obj/item/clothing/under/suit_jacket/female = 30,
		/obj/item/clothing/under/gentlesuit = 30,
		/obj/item/clothing/under/suit_jacket/navy = 30,
		/obj/item/clothing/under/lawyer/oldman = 30,
		/obj/item/clothing/under/lawyer/purpsuit = 30,
		/obj/item/clothing/under/suit_jacket/red = 30,
		/obj/item/clothing/under/lawyer/red = 30,
		/obj/item/clothing/under/lawyer/black = 30,
		/obj/item/clothing/under/suit_jacket/tan = 30,
		/obj/item/clothing/under/scratch = 30,
		/obj/item/clothing/under/lawyer/bluesuit = 30,
		/obj/item/clothing/under/blazer = 30,
		/obj/item/clothing/under/blackjumpskirt = 30,
		/obj/item/clothing/under/kilt = 30,
		/obj/item/clothing/under/sundress_white = 30,
		/obj/item/clothing/under/dress/dress_fire = 30,
		/obj/item/clothing/under/dress/dress_green = 30,
		/obj/item/clothing/under/dress/dress_orange = 30,
		/obj/item/clothing/under/dress/dress_pink = 30,
		/obj/item/clothing/under/dress/dress_purple = 30,
		/obj/item/clothing/under/sundress = 30,
		/obj/item/clothing/suit/storage/toggle/hoodie/cti = 30,
		/obj/item/clothing/suit/storage/toggle/hoodie/mu = 30,
		/obj/item/clothing/suit/storage/toggle/hoodie/nt = 30,
		/obj/item/clothing/suit/storage/toggle/hoodie/smw = 30,
		/obj/item/clothing/suit/storage/toggle/bomber = 30,
		/obj/item/clothing/suit/storage/leather_jacket/nanotrasen = 30,
		/obj/item/clothing/suit/storage/toggle/brown_jacket/nanotrasen = 30,
		/obj/item/clothing/suit/storage/leather_jacket = 30,
		/obj/item/clothing/suit/storage/toggle/brown_jacket = 30,
		/obj/item/clothing/suit/storage/mbill = 30,
		/obj/item/clothing/glasses/green = 30,
		/obj/item/clothing/glasses/hipster = 30,
		/obj/item/clothing/glasses/sunglasses = 30,
		/obj/item/clothing/glasses/aviators_black = 30,
		/obj/item/clothing/glasses/aviators_silver = 30,
		/obj/item/clothing/glasses/aviators_gold = 30,
		/obj/item/clothing/glasses/aviators_rose = 30,
		/obj/item/clothing/shoes/jackboots = 30,
		/obj/item/clothing/shoes/workboots = 30,
		/obj/item/clothing/shoes/dutyboots = 30,
		/obj/item/clothing/shoes/black = 30,
		/obj/item/clothing/shoes/blue = 30,
		/obj/item/clothing/shoes/brown = 30,
		/obj/item/clothing/shoes/laceup = 30,
		/obj/item/clothing/shoes/dress/white = 30,
		/obj/item/clothing/shoes/green = 30,
		/obj/item/clothing/shoes/leather = 30,
		/obj/item/clothing/shoes/orange = 30,
		/obj/item/clothing/shoes/purple = 30,
		/obj/item/clothing/shoes/rainbow = 30,
		/obj/item/clothing/shoes/red = 30,
		/obj/item/clothing/shoes/white = 30,
		/obj/item/clothing/shoes/yellow = 30,
		/obj/item/clothing/gloves/color/evening = 30,
		/obj/item/clothing/head/soft/black = 30,
		/obj/item/clothing/head/soft/blue = 30,
		/obj/item/clothing/head/soft/green = 30,
		/obj/item/clothing/head/soft/grey = 30,
		/obj/item/clothing/head/mailman = 30,
		/obj/item/clothing/head/soft/orange = 30,
		/obj/item/clothing/head/soft/purple = 30,
		/obj/item/clothing/head/soft/rainbow = 30,
		/obj/item/clothing/head/soft/red = 30,
		/obj/item/clothing/head/soft/mime = 30,
		/obj/item/clothing/head/soft/yellow = 30,
		/obj/item/clothing/head/hairflower = 30,
		/obj/item/clothing/head/hairflower/blue = 30,
		/obj/item/clothing/head/hairflower/pink = 30,
		/obj/item/clothing/head/hairflower/yellow = 30,
		/obj/item/clothing/head/boaterhat = 30,
		/obj/item/clothing/head/bowler = 30,
		/obj/item/clothing/head/fedora = 30,
		/obj/item/clothing/head/feathertrilby = 30,
		/obj/item/clothing/head/fez = 30,
		/obj/item/clothing/head/that = 30,
		/obj/item/clothing/head/det = 30,
		/obj/item/clothing/head/det/grey = 30,
		/obj/item/clothing/head/panama = 30
	)

/obj/machinery/vending/npc/civilian/armyman
	name = "Mil-shop Owner"
	icon_state = "npc_civilian1"
	slogan_delay = 20
	product_slogans = "Вообще...я продаю кое-что более деликатное - но не говори копам!;Что? На страйкбол собираетесь?;Смотрите не махайте этим где попало - а то попадёт мне.;Отличная сделка.;У нас только самый лучший товар!"

	products = list(
					/obj/item/tape_roll = 10,
					/obj/item/storage/toolbox/syndicate = 5,
					/obj/item/storage/belt/security = 5,
					/obj/item/storage/belt/holster/machete = 5,
					/obj/item/storage/belt/holster/security/tactical = 5,
					/obj/item/storage/backpack/rucksack/green = 10,
					/obj/item/reagent_containers/food/drinks/glass2/fitnessflask/proteinshake = 10,
					/obj/item/organ/internal/augment/active/item/powerfist = 2,
					/obj/item/melee/telebaton = 2,
					/obj/item/storage/box/handcuffs = 5,
					/obj/item/gun/projectile/flare/loaded = 2,
					/obj/item/gun/launcher/net = 2,
					/obj/item/gun/projectile/shotgun/pump/exploration = 2,
					/obj/item/device/flash = 5,
					/obj/item/device/binoculars = 10,
					/obj/item/ammo_magazine/shotholder/net = 20,
					/obj/item/ammo_magazine/shotholder/stun = 20,
					/obj/item/ammo_magazine/shotholder/beanbag = 20,
					/obj/item/organ/internal/augment/active/item/armblade = 2,
					/obj/item/clothing/under/solgov/utility/army/urban = 10,
					/obj/item/clothing/under/solgov/utility/army/tan = 10,
					/obj/item/clothing/under/solgov/utility/army = 10)

	prices = list(
					/obj/item/tape_roll = 5,
					/obj/item/storage/toolbox/syndicate = 30,
					/obj/item/storage/belt/security = 20,
					/obj/item/storage/belt/holster/machete = 20,
					/obj/item/storage/belt/holster/security/tactical = 20,
					/obj/item/storage/backpack/rucksack/green = 25,
					/obj/item/reagent_containers/food/drinks/glass2/fitnessflask/proteinshake = 15,
					/obj/item/organ/internal/augment/active/item/powerfist = 120,
					/obj/item/melee/telebaton = 50,
					/obj/item/storage/box/handcuffs = 20,
					/obj/item/gun/projectile/flare/loaded = 35,
					/obj/item/gun/launcher/net = 100,
					/obj/item/gun/projectile/shotgun/pump/exploration = 150,
					/obj/item/device/flash = 50,
					/obj/item/device/binoculars = 50,
					/obj/item/ammo_magazine/shotholder/net = 20,
					/obj/item/ammo_magazine/shotholder/stun = 20,
					/obj/item/ammo_magazine/shotholder/beanbag = 20,
					/obj/item/organ/internal/augment/active/item/armblade = 120,
					/obj/item/clothing/under/solgov/utility/army/urban = 20,
					/obj/item/clothing/under/solgov/utility/army/tan = 20,
					/obj/item/clothing/under/solgov/utility/army = 20)

/obj/machinery/vending/npc/civilian/coffeshop
	name = "Cashier"
	icon_state = "npc_civilian3"

	products = list(
					/obj/item/reagent_containers/food/snacks/aesirsalad = 5,
					/obj/item/reagent_containers/food/snacks/applepie = 5,
					/obj/item/reagent_containers/food/snacks/bananapie = 5,
					/obj/item/reagent_containers/food/snacks/caesar_salad = 5,
					/obj/item/reagent_containers/food/snacks/cherrypie = 5,
					/obj/item/reagent_containers/food/snacks/citrusdelight = 5,
					/obj/item/reagent_containers/food/snacks/dionaroast = 5,
					/obj/item/reagent_containers/food/snacks/donut/normal = 10,
					/obj/item/reagent_containers/food/snacks/enchiladas = 5,
					/obj/item/reagent_containers/food/snacks/fishburger = 10,
					/obj/item/reagent_containers/food/snacks/fries = 10,
					/obj/item/reagent_containers/food/snacks/fruitsalad = 5,
					/obj/item/reagent_containers/food/snacks/greek_salad = 5,
					/obj/item/reagent_containers/food/snacks/hamburger = 10,
					/obj/item/reagent_containers/food/snacks/hotdog = 10,
					/obj/item/reagent_containers/food/snacks/icecream = 10,
					/obj/item/reagent_containers/food/snacks/loadedbakedpotato = 5,
					/obj/item/reagent_containers/food/snacks/meatpie = 5,
					/obj/item/reagent_containers/food/snacks/milosoup = 5,
					/obj/item/reagent_containers/food/snacks/omelette = 5,
					/obj/item/reagent_containers/food/snacks/pancakes = 5,
					/obj/item/reagent_containers/food/snacks/sandwich = 10,
					/obj/item/reagent_containers/food/snacks/taco = 10,
					/obj/item/reagent_containers/food/snacks/tomatosoup = 5,
					/obj/item/reagent_containers/food/snacks/vegetablesoup = 5,
					/obj/item/reagent_containers/food/snacks/waffles = 5,
					/obj/item/reagent_containers/food/drinks/tea/black = 10,
					/obj/item/reagent_containers/food/drinks/tea/green = 10,
					/obj/item/reagent_containers/food/drinks/coffee = 10,
					/obj/item/reagent_containers/food/drinks/bottle/lemonjuice = 10,
					/obj/item/reagent_containers/food/drinks/bottle/limejuice = 10,
					/obj/item/reagent_containers/food/drinks/bottle/orangejuice = 10)

	prices = list(
					/obj/item/reagent_containers/food/snacks/aesirsalad = 50,
					/obj/item/reagent_containers/food/snacks/applepie = 30,
					/obj/item/reagent_containers/food/snacks/bananapie = 30,
					/obj/item/reagent_containers/food/snacks/caesar_salad = 50,
					/obj/item/reagent_containers/food/snacks/cherrypie = 30,
					/obj/item/reagent_containers/food/snacks/citrusdelight = 30,
					/obj/item/reagent_containers/food/snacks/dionaroast = 80,
					/obj/item/reagent_containers/food/snacks/donut/normal = 10,
					/obj/item/reagent_containers/food/snacks/enchiladas = 30,
					/obj/item/reagent_containers/food/snacks/fishburger = 30,
					/obj/item/reagent_containers/food/snacks/fries = 10,
					/obj/item/reagent_containers/food/snacks/fruitsalad = 30,
					/obj/item/reagent_containers/food/snacks/greek_salad = 30,
					/obj/item/reagent_containers/food/snacks/hamburger = 30,
					/obj/item/reagent_containers/food/snacks/hotdog = 30,
					/obj/item/reagent_containers/food/snacks/icecream = 10,
					/obj/item/reagent_containers/food/snacks/loadedbakedpotato = 50,
					/obj/item/reagent_containers/food/snacks/meatpie = 50,
					/obj/item/reagent_containers/food/snacks/milosoup = 80,
					/obj/item/reagent_containers/food/snacks/omelette = 30,
					/obj/item/reagent_containers/food/snacks/pancakes = 30,
					/obj/item/reagent_containers/food/snacks/sandwich = 30,
					/obj/item/reagent_containers/food/snacks/taco = 30,
					/obj/item/reagent_containers/food/snacks/tomatosoup = 30,
					/obj/item/reagent_containers/food/snacks/vegetablesoup = 30,
					/obj/item/reagent_containers/food/snacks/waffles = 30,
					/obj/item/reagent_containers/food/drinks/tea/black = 20,
					/obj/item/reagent_containers/food/drinks/tea/green = 20,
					/obj/item/reagent_containers/food/drinks/coffee = 15,
					/obj/item/reagent_containers/food/drinks/bottle/lemonjuice = 15,
					/obj/item/reagent_containers/food/drinks/bottle/limejuice = 15,
					/obj/item/reagent_containers/food/drinks/bottle/orangejuice = 15)
