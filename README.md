## Installation Instructions


Option A: Download Lutris and run my Lutris install script for League of Legends:  
[Lutris 0.4.13](https://lutris.net/downloads/)  
[League of Legends Install Script for Lutris](https://lutris.net/games/league-of-legends/)  

Option B: Without Lutris:  
1. Install wine-staging 2.18 (or higher) for your linux distribution.  

2. Download a copy of my League of Legends wine wrapper repo and extract it somewhere: [leagueoflegends-linux-master-linux-master](https://github.com/GloriousEggroll/leagueoflegends-linux-master/releases/download/1.0/leagueoflegends.zip)  

3. Open the extracted folder in a terminal and:  

    ```  
    chmod a+x install.sh  
    ./install.sh  
    ```  
4. Launch the game via any of the following methods:  

    ```  
    Applications>Games>League of Legends  
    League of Legends desktop shortcut  
    type "leagueoflegends" in a terminal  

## Technical notes:  
AMD users - using a gallium 9 build of wine with gallium 9 instead of CSMT will give you the best results.  
You can do this by typing in terminal:  
WINEDEBUG=-all WINEPREFIX=/home/$USER/League\ of\ Legends winecfg  
then go to the Staging tab, and check Gallium 9 at the bottom. Save and close.  