/datum/design/item/medical
	materials = list(MATERIAL_STEEL = 30, MATERIAL_GLASS = 20)

/datum/design/item/medical/AssembleDesignName()
	..()
	name = "Biotech device prototype ([item_name])"

/datum/design/item/medical/slime_scanner
	desc = "Multipurpose organic life scanner."
	id = "slime_scanner"
	req_tech = list(TECH_MAGNET = 2, TECH_BIO = 4)
	materials = list(MATERIAL_STEEL = 200, MATERIAL_GLASS = 100, MATERIAL_PLASTIC = 150)
	build_path = /obj/item/device/scanner/xenobio
	sort_string = "MACFA"

/datum/design/item/medical/robot_scanner
	desc = "A hand-held scanner able to diagnose robotic injuries."
	id = "robot_scanner"
	req_tech = list(TECH_MAGNET = 3, TECH_ENGINEERING = 4)
	materials = list(MATERIAL_STEEL = 500, MATERIAL_GLASS = 200, MATERIAL_PLASTIC = 150)
	build_path = /obj/item/device/robotanalyzer
	sort_string = "MACFB"

/datum/design/item/medical/analyzer
	desc = "A hand-held scanner able to diagnose injuries."
	id = "health_scanner"
	req_tech = list(TECH_BIO = 3, TECH_MAGNET = 3, TECH_ENGINEERING = 2)
	materials = list(MATERIAL_STEEL = 300, MATERIAL_GLASS = 100, MATERIAL_PLASTIC = 50)
	build_path = /obj/item/device/scanner/health
	sort_string = "MACFC"

/datum/design/item/medical/mass_spectrometer
	desc = "A device for analyzing chemicals in blood."
	id = "mass_spectrometer"
	req_tech = list(TECH_BIO = 3, TECH_MAGNET = 3)
	build_path = /obj/item/device/scanner/spectrometer
	sort_string = "MACAA"

/datum/design/item/medical/adv_mass_spectrometer
	desc = "A device for analyzing chemicals in blood and their quantities."
	id = "adv_mass_spectrometer"
	req_tech = list(TECH_BIO = 4, TECH_MAGNET = 5)
	build_path = /obj/item/device/scanner/spectrometer/adv
	sort_string = "MACAB"

/datum/design/item/medical/reagent_scanner
	desc = "A device for identifying chemicals."
	id = "reagent_scanner"
	req_tech = list(TECH_BIO = 2, TECH_MAGNET = 2)
	build_path = /obj/item/device/scanner/reagent
	sort_string = "MACBA"

/datum/design/item/medical/adv_reagent_scanner
	desc = "A device for identifying chemicals and their proportions."
	id = "adv_reagent_scanner"
	req_tech = list(TECH_MAGNET = 5, TECH_BIO = 6)
	build_path = /obj/item/device/scanner/reagent/adv
	sort_string = "MACBB"

/datum/design/item/medical/nanopaste
	desc = "A tube of paste containing swarms of repair nanites. Very effective in repairing robotic machinery."
	id = "nanopaste"
	req_tech = list(TECH_MATERIAL = 5, TECH_ENGINEERING = 4)
	materials = list(MATERIAL_STEEL = 7000, MATERIAL_GLASS = 7000)
	build_path = /obj/item/stack/nanopaste
	sort_string = "MADAA"

/datum/design/item/medical/hypospray
	desc = "A sterile, air-needle autoinjector for rapid administration of drugs."
	id = "hypospray"
	req_tech = list(TECH_MATERIAL = 4, TECH_BIO = 5)
	materials = list(MATERIAL_STEEL = 2000, MATERIAL_GLASS = 2000, MATERIAL_SILVER = 1000)
	build_path = /obj/item/reagent_containers/hypospray/vial
	sort_string = "MAEAA"

/datum/design/item/medical/cryobag
	desc = "A folded, reusable bag designed to prevent additional damage to an occupant, especially useful if short on time or in \
	a hostile environment."
	id = "cryobag"
	req_tech = list(TECH_MATERIAL = 6, TECH_BIO = 6)
	materials = list(MATERIAL_PLASTIC = 1000, MATERIAL_GLASS = 1000, MATERIAL_SILVER = 1000, MATERIAL_GOLD = 1000)
	build_path = /obj/item/bodybag/cryobag
	sort_string = "MAFAA"

/datum/design/item/medical/auto_cpr
	desc = "A device that gives regular compression to the victim's ribcage, used in case of urgent heart issues."
	id = "auto_cpr"
	req_tech = list(TECH_MAGNET = 2, TECH_BIO = 2)
	materials = list(MATERIAL_SILVER = 100, MATERIAL_PLASTIC = 200, MATERIAL_ALUMINIUM = 1000)
	build_path = /obj/item/auto_cpr
	sort_string = "MAFAB"

/datum/design/item/medical/defib
	desc = "A device that delivers powerful shocks via detachable paddles to resuscitate incapacitated patients."
	id = "defib"
	req_tech = list(TECH_BIO = 4, TECH_POWER = 2)
	materials = list(MATERIAL_SILVER = 1000, MATERIAL_PLASTIC = 900, MATERIAL_ALUMINIUM = 1500, MATERIAL_STEEL = 2000)
	build_path = /obj/item/defibrillator
	sort_string = "MAFAC"

/datum/design/item/medical/defib_compact
	desc = "A device that delivers powerful shocks via detachable paddles to resuscitate incapacitated patients. Compact."
	id = "defib_compact"
	req_tech = list(TECH_BIO = 5, TECH_POWER = 3)
	materials = list(MATERIAL_SILVER = 2000, MATERIAL_PLASTIC = 1200, MATERIAL_ALUMINIUM = 1000, MATERIAL_STEEL = 2000)
	build_path = /obj/item/defibrillator/compact
	sort_string = "MAFAD"

/datum/design/item/medical/defib_combat
	desc = "A device that delivers powerful shocks via detachable paddles to resuscitate incapacitated patients. Combat."
	id = "defib_combat"
	req_tech = list(TECH_BIO = 7, TECH_POWER = 6, TECH_COMBAT = 5)
	materials = list(MATERIAL_SILVER = 2000, MATERIAL_PLASTIC = 1200, MATERIAL_ALUMINIUM = 1000, MATERIAL_STEEL = 2000)
	build_path = /obj/item/defibrillator/compact/combat
	sort_string = "MAFAE"
