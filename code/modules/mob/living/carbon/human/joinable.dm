/mob/living/carbon/human/joinable
	var/mob/living/carbon/human/joinable/brainmob

/mob/living/carbon/human/joinable/attack_ghost(mob/observer/ghost/user)
	var/question = "�� �������, ��� ������ ������ ���� �� ��������� �� �����������?"
	var/ask = alert(question, "�� �� ��� ������� �������� ����, ��� �� �� ��������� ������� ������� ��� ���������!", "��", "���")
	if(!ask)
		return
	if(ask == "���" || mind)
		return
	var/datum/ghosttrap/T = get_ghost_trap("space sleeper")
	T.transfer_personality(user, src)

/mob/living/carbon/human/joinable/proc/PickName()
	src.brainmob.real_name = src.brainmob.name

/mob/living/carbon/human/joinable/proc/UpdateNames()
	var/new_name = brainmob ? brainmob.real_name : ""
	if (new_name)
		if (brainmob)
			brainmob.SetName(new_name)
		SetName("\the [new_name]'s [initial(name)]")
		return
	SetName("\the [initial(name)]")