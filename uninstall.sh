#!/bin/bash
echo "*************************************************"
echo "The next few steps will remove all shortcuts and league of legends files."
echo "*************************************************"

echo "*************************************************"
echo "Removing $HOME/bin/leagueoflegends"
echo "*************************************************"
sudo rm $HOME/bin/leagueoflegends

echo "*************************************************"
echo "Removing $HOME/.local/share/applications/leagueoflegends.desktop"
echo "*************************************************"
sudo rm $HOME/.local/share/applications/leagueoflegends.desktop

echo "*************************************************"
echo "Removing $HOME/Desktop/leagueoflegends.desktop"
echo "*************************************************"
sudo rm $HOME/Desktop/leagueoflegends.desktop

echo "*************************************************"
echo "Removing $HOME/League of Legends"
echo "*************************************************"
sudo rm -R $HOME/League\ of\ Legends

echo "*************************************************"
echo "League of Legends has been successfully removed."
echo "*************************************************"
