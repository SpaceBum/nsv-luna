/mob/verb/who()
	set name = "Who"

	usr << "<b>Current Players:</b>"

	var/list/peeps = list()

	for (var/client/C)
		if (C.stealth && !usr.client.holder)
			peeps += "\t[C.fakekey]"
		else
			peeps += "\t[C][C.stealth ? " <i>(as [C.fakekey])</i>" : ""]"

	peeps = sortList(peeps)

	for (var/p in peeps)
		usr << p

	usr << "<b>Total Players: [length(peeps)]</b>"

/client/verb/adminwho()
	set name = "Adminwho"
	set category = "Commands"

	usr << "<b>Current Tyrants:</b>"

	for (var/client/C)
		if(C.holder)
			if(usr.client.holder)
				usr << "[C.mob.key] is a [C.holder.rank][C.stealth ? " <i>(as [C.fakekey])</i>" : ""]"
			else if(!C.stealth)
				usr << "\t[C] is a [pick(nobles)]"

var/list/nobles = list("Master Chief", "Crusader", "Conqueror", "Overlord", "Pan-Galactic Tycoon", "Master Industrialist", "Federation Marshal", "Planetary Senator", "Security Master Chief", "Major NanoTrasen Shareholder", "Shipbuilding Guardian")