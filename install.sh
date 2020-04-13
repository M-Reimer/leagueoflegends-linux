#!/bin/bash
# Some global WINE configuration variable exports.
# WINEPREFIX can be passed via environment to override the default.
# To do this, run this script with "WINEPREFIX=..." in front of the command:
# $ WINEPREFIX=$HOME/.wineprefix/LoL ./install.sh
export WINEARCH=win32
export WINEDEBUG=-all
export WINEPREFIX=${WINEPREFIX:-"$HOME/.wineprefix/LoL"}

mkdir -p "$WINEPREFIX"

echo "*************************************************"
echo "Creating wine prefix and performing winetricks."
echo "*************************************************"

winetricks -q d3dx9

echo "*************************************************"
echo "Applying League of Legends wine prefix registry settings."
echo "*************************************************"
wine regedit /S lol.reg


echo "*************************************************"
echo "Installing League of Legends. !!!Please do not launch the game!!!"
echo "*************************************************"

echo "Select your region: "
echo "[1] North America"
echo "[2] Europe West "
# FIXME: Add more regions?
echo "Select an option -> "
read op
if [ $op == 1 ]; then
	wget 'https://riotgamespatcher-a.akamaihd.net/releases/live/installer/deploy/League%20of%20Legends%20installer%20NA.exe'
	/opt/wine-lol/bin/wine 'League of Legends installer NA.exe'

elif [ $op == 2 ]; then
		wget 'https://riotgamespatcher-a.akamaihd.net/releases/live/installer/deploy/League%20of%20Legends%20installer%20EUW.exe'
		/opt/wine-lol/bin/wine 'League of Legends installer EUW.exe'

else
	echo "Wrong option"
	exit 
fi




# TODO: The installer will create shortcuts (or better wine will create them)
#       - Locate these .desktop files
#       - Delete them

echo "*************************************************"
echo "The next few steps will prompt you for shortcut creations."
echo "*************************************************"

echo "*************************************************"
echo "Creating League of Legends shell script"
echo "*************************************************"

# This is the "user local" BIN-directory for many distributions
mkdir -p "$HOME/bin"

echo "#!/bin/bash" > leagueoflegends.sh
echo "export __GL_THREADED_OPTIMIZATIONS=1" >> leagueoflegends.sh
echo "export MESA_GLTHREAD=TRUE" >> leagueoflegends.sh
echo "export GPU_MAX_HEAP_SIZE=100" >> leagueoflegends.sh
echo "export GPU_MAX_ALLOC_PERCENT=100" >> leagueoflegends.sh

echo "WINEARCH=win32 WINEPREFIX=\"$WINEPREFIX\" WINEDEBUG=-all /opt/wine-lol/bin/wine \"C:/Riot Games/League of Legends/LeagueClient.exe\"" >> leagueoflegends.sh

chmod a+x leagueoflegends.sh
cp leagueoflegends.sh "$HOME/bin/leagueoflegends"


read -p "Would you like a menu shortcut? y/n" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo "*************************************************"
	echo "Creating League of Legends application menu shortcut."
	echo "*************************************************"

	echo "[Desktop Entry]" > leagueoflegends.desktop
	echo "Encoding=UTF-8" >> leagueoflegends.desktop
	echo "Name=League of Legends" >> leagueoflegends.desktop
	echo "GenericName=League of Legends" >> leagueoflegends.desktop
	echo "Exec=$HOME/bin/leagueoflegends \"\$@\"" >> leagueoflegends.desktop
	echo "Icon=$WINEPREFIX/drive_c/Riot\ Games/League\ of\ Legends/RADS/system/lcu.ico" >> leagueoflegends.desktop
	echo "StartupNotify=true" >> leagueoflegends.desktop
	echo "Terminal=false" >> leagueoflegends.desktop
	echo "Type=Application" >> leagueoflegends.desktop
	echo "Categories=Application;Game" >> leagueoflegends.desktop

	cp leagueoflegends.desktop "$HOME/.local/share/applications/"
	update-desktop-database "$HOME/.local/share/applications"
fi

read -p "Would you like a desktop shortcut? y/n" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo "*************************************************"
	echo "Creating League of Legends desktop shortcut."
	echo "*************************************************"
	cp leagueoflegends.desktop "$HOME/Desktop/"
fi


echo "*************************************************"
echo "Installation complete! It is safe to delete this folder."
echo "*************************************************"
