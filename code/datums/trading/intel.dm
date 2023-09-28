/datum/trader/ship/intel_collector
	name = "���������� ��������"
	origin = "������������� � ����"
	trade_flags = TRADER_GOODS|TRADER_MONEY|TRADER_WANTED_ONLY|TRADER_WANTED_ALL
	want_multiplier = 1.5
	margin = 2
	possible_origins = list("PV '������������� � ����'", "PV '������������'",)
	speech = list(TRADER_HAIL_GENERIC    = "��� ����� ������, � ��� ������. �� ��������� ������ �������� � �� �����������.",
				TRADER_HAIL_DENY         = "...",

				TRADER_TRADE_COMPLETE    = "��...� ����� ������� �� ����� ��������� ������.",
				TRADER_NO_BLACKLISTED   = "���� �� ���������� �������� ����������.",
				TRADER_FOUND_UNWANTED = "��������, �� ���� �� ���� �� �������.",
				TRADER_NOT_ENOUGH   = "��� ����������� ���� ������, ���� �� ������ ��� ������...",
				TRADER_HOW_MUCH          = "� ����� ������� ��� ��� ���������� �� VALUE CURRENCY.",
				TRADER_WHAT_WANT         = "�� ������ ������ � �������� � �������...",

				TRADER_COMPLEMENT_FAILURE   = "������� ��������� �� ������ ��������.",
				TRADER_COMPLEMENT_SUCCESS = "������ �������� ���� ��������, �� � ����� ���� ���� �������.",
				TRADER_INSULT_GOOD       = "������� ��������, ������� ������ �� ������...�������, ������� �� ���, ����� ��� �� �������� ����� ����� ����.",
				TRADER_INSULT_BAD        = "������ �������.",
				)

	overmap_object_color = COLOR_BLACK

	insult_drop = 0
	compliment_increase = 0

	possible_wanted_items = list(/obj/item/fd/data = TRADER_SUBTYPES_ONLY)