#!/bin/bash -x
	echo "Welcome to Snake and Ladder Simulator"

	PLAYER_NO=1
	START_POSITION=0
	#function generates a dice role by generating a random number 1 to 6
	function DiceRoller(){
		roller=$((RANDOM%6+1))
		return $roller
	}
	DiceRoller
