#!/bin/bash
	echo "Welcome to Snake and Ladder Simulator"

	read -p "Enter the Max number of players " MAX

	read -p "Enter the Winnig Position for this Game " WIN_POSITION
	SWITCH=1
	START_POSITION=1
	function DiceRoller(){
		roller=$((RANDOM%6+1))
	}

	currentPosition=$START_POSITION
	DICE_ROLLS=0
	function gamePlaySimulation(){
	NO_PLAY_CASE=0
   LADDER_CASE=1
   SNAKE_CASE=2


	optionGenerator=$((RANDOM%3))
	case $optionGenerator in
	$NO_PLAY_CASE)
		(( DICE_ROLLS++ ))
		currentPosition=$(( currentPosition + 0 ))
		;;
   $LADDER_CASE)
		(( DICE_ROLLS++ ))
		DiceRoller
		currentPosition=$(( currentPosition + roller ))
		if [ $currentPosition -gt $WIN_POSITION ]
		then
		currentPosition=$(( currentPosition - roller ))
		fi
		;;
   $SNAKE_CASE)
		(( DICE_ROLLS++ ))
		DiceRoller
			currentPosition=$(( currentPosition - roller ))
		;;
	esac
		}

	while [ true ]
	do
	gamePlaySimulation
	(( DICE_ROLLS++ ))
	 echo "Face Value = $roller current position = $currentPosition"
		if [ $currentPosition -eq $WIN_POSITION ]
		then
			break
		elif [ $currentPosition -lt $START_POSITION ]
		then
			currentPosition=$START_POSITION
		fi
	done
	echo "Current Position = $currentPosition  Reached Final"
	echo "total dice Rolls $DICE_ROLLS "


	for (( playerNo=1; playerNo<=$MAX; playerNo++ ))
	do
		if [ $((SWITCH%$MAX)) -eq $playerNo  ]
			then
			(( SWITCH++ ))
				gamePlaySimulation
				if [ $currentPosition -eq $WIN_POSITION ]
					then
						echo $playerNo " won"
						break
				fi
		fi
	done

