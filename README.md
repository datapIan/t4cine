# *t4cine*
<img src="https://images2.alphacoders.com/901/thumb-1920-90152.jpg" alt="screenshot" height="250px" width="400px" align="right"/>

**A Port of [Sass' Cinematic Mod](https://github.com/sortileges/iw4cine) to Call of Duty World at War**

<div align="left">
<a href="https://github.com/datapIan/t4cine/releases"><img src="https://img.shields.io/github/v/release/datapIan/t4cine?label=Latest%20Release&style=flat-square"></a>
  <a href="https://github.com/datapIan/t4cine/releases""><img src="https://img.shields.io/github/downloads/datapIan/t4cine/total?style=flat-square"></a>

<p align="left">
  <a href="#requirements">Requirements</a> •
  <a href="#installation">Installation</a> •
  <a href="#usage">Usage</a> •
  <a href="#issues">Issues</a> •
  <a href="#credits">Credits</a>
</p>

Sass' mod changed the way we made cinematics on Modern Warfare 2. I believed the same level of customization should be added to all the other games.

This mod is missing actor functionality due to the game not having the right functions for it.

<br/><br/>
## Requirements

In order to use this mod, you'll need a copy of World of War with/without a client installed.

It is recommended you use this mod with [Plutonium](https://plutonium.pw) as this is the client the mod was built on. Plus, some functions don't work on Steam WAW.

<br/><br/>
## Installation

Simply download the mod through [this link](https://github.com/datapIan/t4cine/releases/latest). Scroll down and click on `Source code.zip` and download the file.

<img src="https://i.imgur.com/DvQBhh0.png" alt="screenshot" height="230px" width="300px" align="right"/>

Once the mod is downloaded, extract the ZIP file and run either install script to automatically install the mod into either [Plutonium](https://plutonium.pw) or Steam mods folders. Alternatively, you can drag the `mp_t4cine` folder into your `WAW/mods` folder. If the `mods` folder doesn't exist, create it.

```
C:/
└── .../
    └── WAW/
        └── mods/
            └── mp_t4cine
```

- [Plutonium](https://plutonium.pw) full path: `%localappdata%\Plutonium\storage\t4`

- Steam full path: `%localappdata%\Activision\CoDWaW`

Once this is done open your game, then click on the "Mods" tab. `mp_t4cine` should appear in the list; click on it once and then click on "Launch" to restart your game with the mod on.

<br/><br/>
## Usage

* Most commands in-game function the same way as they did in MW2, except for the toggling type commands: `about, clone, clearbodies, mvm_eb, and mvm_bot_holdgun`
  
  └── These commands are required to be typed as `command` followed by a 1. Example: `clearbodies 1`
* BotSpawn command arguments are `class = ar, smg, lmg, shotgun, sniper`, `team = allies, axis`
* BotModel command arguments are `SNIPER, SUPPORT, ASSAULT, RECON, SPECOPS, FLAMETHROWER`
* BotWeapon command arugments are `weapon = weapon name (springfield_mp)`
* BotKill command arguments are `mode = head, body, shotgun, fire`
* EnvColors command arguments are the name of any zone, example: `mvm_env_colors mp_castle`
* EnvFog command arguments are `startdist, halfdist, red, green, blue`, example: `100 1000 1 .2 .7`
* EnvProp command arguments are models in the current map, common_mp, or a custom fastfile. If from a custom fastfile or another map, it must be precached!

  └── ~~A list of common_mp xmodels can be found [here]().~~
* EnvFx command arguments are fx in the current map, common_mp, or a custom fastile. If from a custom fastfile or another map, it must be precached!
  
  └── Additionally, the arguments must be typed as `folder/filename`, example: `misc/flare`.
  
  └── ~~A list of common_mp fx's can be found [here]().~~
  
<br/><br/>
## Issues
* ***Actors*** - Currently there is no support for actors and I don't think there ever will be.

### To report bugs or feature requests, please do so through [this](https://github.com/datapIan/t4cine/issues) link.

<br/><br/>
## Credits

* [Antiga](https://github.com/mprust) - Helped with .gsc related questions.
* [Expert](https://github.com/soexperttt) - :cat_kiss:
* [Sass](https://github.com/sortileges) - Created the original MW2 Cinematic Mod.
* [yoyo1love](https://github.com/yoyothebest) - :cat_kiss:
