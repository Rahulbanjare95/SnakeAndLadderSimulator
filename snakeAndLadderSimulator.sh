#!/bin/bash
	echo "Welcome to Snake and Ladder Simulator"

	read -p "Enter the Max number of players " MAX

	read -p "Enter the Winnig Position for this Game " WIN_POSITION
	SWITCH=1
	START_POSITION=0
	NO_PLAY_CASE=0
	LADDER_CASE=1
	SNAKE_CASE=2
	function DiceRoller(){
		roller=$((RANDOM%6+1))
	}

	currentPosition=$START_POSITION
	diceRolls=0
	function gamePlaySimulation(){

	optionGenerator=$((RANDOM%3))
	case $optionGenerator in
	$NO_PLAY_CASE)
		(( diceRolls++ ))
		currentPosition=$(( currentPosition + 0 ))
		echo "Face Value = 0 NO_PLAY current position = $currentPosition"
		;;
   $LADDER_CASE)
		(( diceRolls++ ))
		DiceRoller
		currentPosition=$(( currentPosition + roller ))
		if [ $currentPosition -gt $WIN_POSITION ]
		then
		currentPosition=$(( currentPosition - roller ))
		fi

		echo "Face Value = $roller LADDER  current position = $currentPosition"
		;;
   $SNAKE_CASE)
		(( diceRolls++ ))
		DiceRoller
			currentPosition=$(( currentPosition - roller ))
		echo "Face Value = $roller SNAKE current position = $currentPosition"
		;;
	esac
	}


	while [ true ]
	do
	gamePlaySimulation
		if [ $currentPosition -eq $WIN_POSITION ]
		then
			break
		elif [ $currentPosition -lt $START_POSITION ]
		then
			currentPosition=$START_POSITION
		fi
	done
	echo "Current Position = $currentPosition to Reach Final"
	echo "dice Rolls to Win $diceRolls "


	for (( playerNo=1; playerNo<=$MAX; playerNo++ ))
	do
		if [ $((SWITCH%$MAX)) -eq $playerNo ]
			then
			(( SWITCH++ ))
				gamePlaySimulation
				if [ $currentPosition -eq $WIN_POSITION ]
					then
						echo "PLayer $playerNo won "
						break
				fi
		fi
	done

