#!bin/bash
in_src="CodeHttp.csv"
checkCode=$(cat "${in_src}" | grep "$1" | cut -d',' -f2)
type=$(cat "$in_src" | grep "$checkCode" | cut -d',' -f1)
message=$(cat "$in_src" | grep "$checkCode" | cut -d',' -f3)
detail=$(cat "$in_src" | grep "$checkCode" | cut -d',' -f4)
help=(
echo "†=========================================================†"
echo "commandes -t type -d detail -h help"
echo "exemple for external use -> getHttp yourHttpCode Param(s)"
echo "example for internal use ->"
echo "†=========================================================†"
)
case "$#" in
	0) echo "Erreur aucun parametre "
	;;
	1)
		if [ -z "$checkCode" ]
			then
				echo "Erreur - Code Http non trouve"
			else
				if [ "$1" == "-h" ]
					then  
						echo "$help"
				fi
		fi
	;;
	2)
		if [[ $2 == "-t" ]]
			then
				echo "$type"
		fi
		if [[ $2 == "-m" ]]
			then
				echo "$message"
		fi
		if [[ $2 == "-d" ]]
			then
				echo "$detail"
		fi
	;;
	3)
				if [[ $3 == "-t" ]]
			then
				echo "$type"
		fi
		if [[ $3 == "-m" ]]
			then
				echo "$message"
		fi
		if [[ $3 == "-d" ]]
			then
				echo "$detail"
		fi
	;;
	*) echo "Erreur - trop de parametres"
	;;
esac
