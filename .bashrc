addautoreminder()
{
	local filename="$1";
	shift;
	echo "$@" > "$HOME/.autoreminders/$filename";
}

rmautoreminder()
{
	if [ -e "$HOME/.autoreminders/$1" ]; then
		rm "$HOME/.autoreminders/$1"
	fi
}

reminders()
{
	echo -e "\e[7m###########################"
	echo -e "\e[7m# \e[1mREMINDERS                \e[0m"
	echo -e "\e[7m###########################"
	for file in "$HOME/.autoreminders/"*; do
		if [ -s "$file" ]; then
			local fname=$(echo $file | sed "s/.*\///");
			cat "$file" | while read line; do echo -e "\e[7m#\e[0m ! $fname: \e[5m$line\e[0m !"; done
		fi
	done
	local i=0;
	cat "$HOME/reminders" | while read line; do ((i++)); echo -e "\e[7m#\e[0m $i. $line" ; done
	echo -e "\e[7m###########################\e[0m"
	echo
}

# Show reminders when a terminal opens
reminders
