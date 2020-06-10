#!/bin/bash -x
	echo "Welcome to Snake and Ladder Simulator"

	PLAYER_NO=1
	START_POSITION=0
	#below variables defines the movement for player
	NO_PLAY_CASE=0
	LADDER_CASE=1
	SNAKE_CASE=2

	#function generates a dice role by generating a random number 1 to 6
	function DiceRoller(){
		roller=$((RANDOM%6+1))
		return $roller
	}

	currentPosition=$START_POSITION

	function gamePlaySimulation(){
	optionGenerator=$((RANDOM%3))

	case $optionGenerator in
	$NO_PLAY_CASE)
		currentPosition=$((currentPosition+0))
		;;
   $LADDER_CASE)
		DiceRoller
		currentPosition=$((currentPosition + roller))
		;;
   $SNAKE_CASE)
		DiceRoller
		currentPosition=$((currentPosition - roller))
		;;
	esac
	}
	gamePlaySimulation
