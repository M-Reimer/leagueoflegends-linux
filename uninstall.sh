#!/bin/bash
echo "*************************************************"
echo "The next few steps will remove all shortcuts and league of legends files."
echo "*************************************************"

echo "*************************************************"
echo "Removing $HOME/bin/leagueoflegends"
echo "*************************************************"
rm $HOME/bin/leagueoflegends

echo "*************************************************"
echo "Removing $HOME/.local/share/applications/leagueoflegends.desktop"
echo "*************************************************"
rm $HOME/.local/share/applications/leagueoflegends.desktop

echo "*************************************************"
echo "Removing $HOME/Desktop/leagueoflegends.desktop"
echo "*************************************************"
rm $HOME/Desktop/leagueoflegends.desktop

echo "*************************************************"
echo "Removing $HOME/.wineprefix/LoL"
echo "*************************************************"
rm -r $HOME/.wineprefix/LoL

echo "*************************************************"
echo "League of Legends has been successfully removed."
echo "*************************************************"
