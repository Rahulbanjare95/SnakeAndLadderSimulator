#!/bin/bash -x
	echo "Welcome to Snake and Ladder Simulator"
	read -p "Enter the Winnig Position for this Game " WIN_POSITION
	PLAYER_ONE=0
	PLAYER_TWO=1
	START_POSITION=1
	NO_PLAY_CASE=0
   LADDER_CASE=1
   SNAKE_CASE=2
	SWITCH=1
	currentPosition=$START_POSITION
   diceRollCount=0

	function diceFaceValue(){
		roller=$((RANDOM%6+1))
	}

	function gamePlaySimulation()
	{
		diceFaceValue
		playCaseGenerator=$((RANDOM%3))
		case $playCaseGenerator in
				$NO_PLAY_CASE)
					currentPosition=$(( currentPosition + 0 ))
					;;
   			$LADDER_CASE)
					currentPosition=$(( currentPosition + roller ))
					if [ $currentPosition -gt $WIN_POSITION ]
					then
						currentPosition=$(( currentPosition - roller ))
					fi
					;;
   			$SNAKE_CASE)
						currentPosition=$(( currentPosition - roller ))
					;;
		esac
		echo $currentPosition
	}

	function finalPosition() {
			gamePlaySimulation
			(( diceRollCount++ ))
			if [ $currentPosition -eq $WIN_POSITION ]
				then
					echo "$currentPosition"
			elif [ $currentPosition -lt $START_POSITION ]
				then
					currentPosition=$START_POSITION
			fi
	}

	function winner(){
		while ( true )
		do
			if [ $((SWITCH%2)) -eq $PLAYER_ONE ]
			then
				finalPosition
				if [ $currentPosition -eq $WIN_POSITION ]
				then
					echo "1 won"
					break
				fi
			fi
			((SWITCH++))

			if [ $((SWITCH%2)) -eq $PLAYER_TWO ]
				then
					finalPosition
					if [ $currentPosition -eq $WIN_POSITION ]
					then
						echo "2 won"
						break
					fi
			fi
	done
	}

	winner




