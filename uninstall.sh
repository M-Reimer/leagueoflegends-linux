#!/bin/bash
echo "*************************************************"
echo "The next few steps will remove all shortcuts and league of legends files."
echo "If root is required, please enter your root password when prompted."
echo "*************************************************"

echo "*************************************************"
echo "Removing /usr/bin/leagueoflegends"
echo "*************************************************"
sudo rm -R /usr/bin/leagueoflegends

echo "*************************************************"
echo "Removing /usr/share/pixmaps/leagueoflegends.ico"
echo "*************************************************"
sudo rm -R /usr/share/pixmaps/leagueoflegends.ico

echo "*************************************************"
echo "Removing /usr/share/applications/leagueoflegends.desktop"
echo "*************************************************"
sudo rm -R /usr/share/applications/leagueoflegends.desktop 

echo "*************************************************"
echo "Removing sudo rm -R /home/$USER/Desktop/leagueoflegends.desktop"
echo "*************************************************"
sudo rm -R /home/$USER/Desktop/leagueoflegends.desktop

echo "*************************************************"
echo "Removing home/$USER/League of Legends"
echo "*************************************************"
sudo rm -R /home/$USER/League\ of\ Legends

echo "*************************************************"
echo "League of Legends has been successfully removed."
echo "*************************************************"
