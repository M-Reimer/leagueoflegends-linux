## Installation Instructions

Please be sure to install wine system dependencies. This can usually be achieved by installing wine on your system through your package manager. Additionally, these extra packages are necessary for wine to run LoL:  
[League of Legends additional Dependencies](https://wiki.archlinux.org/index.php/League_of_Legends#Install_the_dependencies)

Additional help can be found here:
[How to get out of Wine Dependency Hell](https://www.gloriouseggroll.tv/how-to-get-out-of-wine-dependency-hell/)

If you are on nvidia you will also need lib32-nvidia-utils on Arch.

Option A: Download Lutris and run my Lutris install script for League of Legends:  
[Lutris 0.4.13](https://lutris.net/downloads/)  
[League of Legends Install Script for Lutris](https://lutris.net/games/league-of-legends/)  

Option B: Without Lutris:  
1. Install wine-staging 2.18 (or higher) for your linux distribution.  

2. Download a copy of my League of Legends wine wrapper repo and extract it somewhere: [leagueoflegends-linux-master](https://github.com/GloriousEggroll/leagueoflegends-linux/archive/master.zip)  

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
    ```  

## Uninstallation/Removal Instructions
This applies to non-lutris only: 

    ```  
    chmod a+x uninstall.sh  
    ./uninstall.sh  
    ``` 
