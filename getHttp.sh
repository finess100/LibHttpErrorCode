#!bin/bash
in_src="CodeHttp.csv"
checkCode=$(cat "${in_src}" | grep "$1" | cut -d',' -f2)
type=$(cat "$in_src" | grep "$checkCode" | cut -d',' -f1)
message=$(cat "$in_src" | grep "$checkCode" | cut -d',' -f3)
detail=$(cat "$in_src" | grep "$checkCode" | cut -d',' -f4)
for param in "$@"
do
	if [ -z "$checkCode" ]
		then
			echo "Erreur - Code Http non trouve"
			exit 1
	fi
	if [ -z "$param" ]
		then
			echo "Erreur - Aucun parametre trouve"
			exit 1
	fi
	if [ "$param" == "-t" ]
		then
			if [ -z "$resultat" ]
				then resultat="$type"
				else resultat="$resultat | $type"
			fi
	fi
	if [ "$param" == "-m" ]
		then
			if [ -z "$resultat" ]
				then resultat="$message"
				else resultat="$resultat | $message"
			fi
	fi
	if [ "$param" == "-d" ]
		then
			if [ -z "$resultat" ]
				then resultat="$detail"
				else resultat="$resultat | $detail"
			fi
	fi
done
#Rendu du résultat du code entré
echo "$resultat"
