#!/bin/bash
	echo "Welcome to Snake and Ladder Simulator"

	PLAYER_NO=1
	START_POSITION=0
	NO_PLAY_CASE=0
	LADDER_CASE=1
	SNAKE_CASE=2
	WIN_POSITION=100

	function DiceRoller(){
		roller=$((RANDOM%6+1))
	}

	currentPosition=$START_POSITION

	function gamePlaySimulation(){

	optionGenerator=$((RANDOM%3))
	case $optionGenerator in
	$NO_PLAY_CASE)
		currentPosition=$(( currentPosition + 0 ))
		echo "Face Value = 0 NO_PLAY  position = $currentPosition"
		;;
   $LADDER_CASE)
		DiceRoller
		currentPosition=$(( currentPosition + roller ))
		echo "Face Value = $roller LADDER  position = $currentPosition"
		;;
   $SNAKE_CASE)
		DiceRoller
			currentPosition=$(( currentPosition - roller ))
		echo "Face Value = $roller SNAKE position = $currentPosition"
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
	echo "Current Position = $currentPosition  so Reached Final"
