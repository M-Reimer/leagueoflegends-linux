#!/bin/bash
echo "*************************************************"
echo "The next few steps will remove all shortcuts and league of legends files."
echo "*************************************************"

echo "*************************************************"
echo "Removing $HOME/bin/leagueoflegends"
echo "*************************************************"
rm $HOME/bin/leagueoflegends

echo "*************************************************"
echo "Removing $HOME/bin/lol-launchhelper"
echo "*************************************************"
rm $HOME/bin/lol-launchhelper

echo "*************************************************"
echo "Removing $HOME/.local/share/applications/leagueoflegends.desktop"
echo "*************************************************"
rm $HOME/.local/share/applications/leagueoflegends.desktop

echo "*************************************************"
echo "Removing $HOME/Desktop/leagueoflegends.desktop"
echo "*************************************************"
DESKTOP_PATH=$(xdg-user-dir DESKTOP 2>/dev/null || echo "$HOME/Desktop")
rm "$DESKTOP_PATH/leagueoflegends.desktop"

echo "*************************************************"
echo "Removing $HOME/.wineprefix/LoL"
echo "*************************************************"
rm -r $HOME/.wineprefix/LoL

echo "*************************************************"
echo "League of Legends has been successfully removed."
echo "*************************************************"
