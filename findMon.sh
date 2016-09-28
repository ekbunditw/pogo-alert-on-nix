#!/bin/bash

# Watchlist configuration get pokemon name below.
WATCHLISTBYCOMMA="DRATINI,DRAGONAIR,DRAGONITE,PORYGON,OMANYTE,KABUTO,KABUTOPS,SNORLAX,EEVEE,CHARMANDER,CHARMELEON,CHARIZARD,PIKACHU,VULPIX,JIGGLYPUFF,WIGGLYTUFF,GROWLITHE,ARCANINE"

WATCHLIST=""`echo $WATCHLISTBYCOMMA | sed -e 's:,:\\\|:g'`

echo "WATCHLIST : "$WATCHLISTBYCOMMA;
WATCHLISTS=$(echo $WATCHLISTBYCOMMA | tr "," "\n");
while true
do
# curl command for those who need proxy

# CURL_RESULT=`curl -v --silent -x user:pass@proxy-host:proxy-port 'https://cache.fastpokemap.se/?key=allow-all&ts=0&lat=your_lat&lng=your_lng' -H 'origin: https://fastpokemap.se' -H 'accept-encoding: gzip, deflate, sdch, br' -H 'accept-language: th,en-US;q=0.8,en;q=0.6' -H 'user-agent: Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.76 Mobile Safari/537.36' -H 'accept: application/json, text/javascript, */*; q=0.01' -H 'authority: cache.fastpokemap.se' --compressed --stderr -`


#curl command for normal situation
CURL_RESULT=`curl -v --silent 'https://cache.fastpokemap.se/?key=allow-all&ts=0&lat=your_lat&lng=your_lng' -H 'origin: https://fastpokemap.se' -H 'accept-encoding: gzip, deflate, sdch, br' -H 'accept-language: th,en-US;q=0.8,en;q=0.6' -H 'user-agent: Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.76 Mobile Safari/537.36' -H 'accept: application/json, text/javascript, */*; q=0.01' -H 'authority: cache.fastpokemap.se' --compressed --stderr -`
if [ `echo $CURL_RESULT | grep $WATCHLIST | wc -l` -gt 0 ]; then
	WATCHLISTFOUND="";
	for each in $WATCHLISTS
	do
		if [ `echo $CURL_RESULT | grep $each | wc -l ` -gt 0 ]; then
			WATCHLISTFOUND=$WATCHLISTFOUND""$each;
			WATCHLISTFOUND=$WATCHLISTFOUND",";
		fi
	done
	
	WATCHLISTFOUND="Check the map for these : "$WATCHLISTFOUND
	WATCHLISTFOUND=${WATCHLISTFOUND::${#WATCHLISTFOUND}-1}
	
	# notify on mac
	osascript \
  		-e "on run(argv)" \
  		-e "return display notification item 1 of argv with title \"Watchlist Pokemon found!\"" \
	  	-e "end" \
	  	-- "$WATCHLISTFOUND"
	  	
	# notify on ubuntu 
	# have not tested it yet.
# 	notify-send 'Watchlist Pokemon found!' 'Some pokemon just found.'
	
	
	# in sec
	sleep 120;
else
	echo 'nothing found!';
	# in sec
	sleep 20;
fi

done


# 	  Appendix
# this list is extracted from script.js on fastpokemap.se
#     "BULBASAUR": 1,
#     "IVYSAUR": 2,
#     "VENUSAUR": 3,
#     "CHARMANDER": 4,
#     "CHARMELEON": 5,
#     "CHARIZARD": 6,
#     "SQUIRTLE": 7,
#     "WARTORTLE": 8,
#     "BLASTOISE": 9,
#     "CATERPIE": 10,
#     "METAPOD": 11,
#     "BUTTERFREE": 12,
#     "WEEDLE": 13,
#     "KAKUNA": 14,
#     "BEEDRILL": 15,
#     "PIDGEY": 16,
#     "PIDGEOTTO": 17,
#     "PIDGEOT": 18,
#     "RATTATA": 19,
#     "RATICATE": 20,
#     "SPEAROW": 21,
#     "FEAROW": 22,
#     "EKANS": 23,
#     "ARBOK": 24,
#     "PIKACHU": 25,
#     "RAICHU": 26,
#     "SANDSHREW": 27,
#     "SANDSLASH": 28,
#     "NIDORAN_FEMALE": 29,
#     "NIDORINA": 30,
#     "NIDOQUEEN": 31,
#     "NIDORAN_MALE": 32,
#     "NIDORINO": 33,
#     "NIDOKING": 34,
#     "CLEFAIRY": 35,
#     "CLEFABLE": 36,
#     "VULPIX": 37,
#     "NINETALES": 38,
#     "JIGGLYPUFF": 39,
#     "WIGGLYTUFF": 40,
#     "ZUBAT": 41,
#     "GOLBAT": 42,
#     "ODDISH": 43,
#     "GLOOM": 44,
#     "VILEPLUME": 45,
#     "PARAS": 46,
#     "PARASECT": 47,
#     "VENONAT": 48,
#     "VENOMOTH": 49,
#     "DIGLETT": 50,
#     "DUGTRIO": 51,
#     "MEOWTH": 52,
#     "PERSIAN": 53,
#     "PSYDUCK": 54,
#     "GOLDUCK": 55,
#     "MANKEY": 56,
#     "PRIMEAPE": 57,
#     "GROWLITHE": 58,
#     "ARCANINE": 59,
#     "POLIWAG": 60,
#     "POLIWHIRL": 61,
#     "POLIWRATH": 62,
#     "ABRA": 63,
#     "KADABRA": 64,
#     "ALAKAZAM": 65,
#     "MACHOP": 66,
#     "MACHOKE": 67,
#     "MACHAMP": 68,
#     "BELLSPROUT": 69,
#     "WEEPINBELL": 70,
#     "VICTREEBEL": 71,
#     "TENTACOOL": 72,
#     "TENTACRUEL": 73,
#     "GEODUDE": 74,
#     "GRAVELER": 75,
#     "GOLEM": 76,
#     "PONYTA": 77,
#     "RAPIDASH": 78,
#     "SLOWPOKE": 79,
#     "SLOWBRO": 80,
#     "MAGNEMITE": 81,
#     "MAGNETON": 82,
#     "FARFETCHD": 83,
#     "DODUO": 84,
#     "DODRIO": 85,
#     "SEEL": 86,
#     "DEWGONG": 87,
#     "GRIMER": 88,
#     "MUK": 89,
#     "SHELLDER": 90,
#     "CLOYSTER": 91,
#     "GASTLY": 92,
#     "HAUNTER": 93,
#     "GENGAR": 94,
#     "ONIX": 95,
#     "DROWZEE": 96,
#     "HYPNO": 97,
#     "KRABBY": 98,
#     "KINGLER": 99,
#     "VOLTORB": 100,
#     "ELECTRODE": 101,
#     "EXEGGCUTE": 102,
#     "EXEGGUTOR": 103,
#     "CUBONE": 104,
#     "MAROWAK": 105,
#     "HITMONLEE": 106,
#     "HITMONCHAN": 107,
#     "LICKITUNG": 108,
#     "KOFFING": 109,
#     "WEEZING": 110,
#     "RHYHORN": 111,
#     "RHYDON": 112,
#     "CHANSEY": 113,
#     "TANGELA": 114,
#     "KANGASKHAN": 115,
#     "HORSEA": 116,
#     "SEADRA": 117,
#     "GOLDEEN": 118,
#     "SEAKING": 119,
#     "STARYU": 120,
#     "STARMIE": 121,
#     "MR_MIME": 122,
#     "SCYTHER": 123,
#     "JYNX": 124,
#     "ELECTABUZZ": 125,
#     "MAGMAR": 126,
#     "PINSIR": 127,
#     "TAUROS": 128,
#     "MAGIKARP": 129,
#     "GYARADOS": 130,
#     "LAPRAS": 131,
#     "DITTO": 132,
#     "EEVEE": 133,
#     "VAPOREON": 134,
#     "JOLTEON": 135,
#     "FLAREON": 136,
#     "PORYGON": 137,
#     "OMANYTE": 138,
#     "OMASTAR": 139,
#     "KABUTO": 140,
#     "KABUTOPS": 141,
#     "AERODACTYL": 142,
#     "SNORLAX": 143,
#     "ARTICUNO": 144,
#     "ZAPDOS": 145,
#     "MOLTRES": 146,
#     "DRATINI": 147,
#     "DRAGONAIR": 148,
#     "DRAGONITE": 149,
#     "MEWTWO": 150,
#     "MEW": 151

