# *t4cine*
<img src="https://images3.alphacoders.com/108/1080039.png" alt="screenshot" height="250px" align="right"/>

**A Port of [Sass' Cinematic Mod](https://github.com/sortileges/iw4cine) to Call of Duty World at War**

<p align="left">
  <a href="#about">About</a> •
  <a href="#installation">Installation</a> •
  <a href="#usage">Usage</a> •
  <a href="#issues">Issues</a> •
  <a href="#credits">Credits</a>
</p>

<div align="left">
<a href="https://github.com/datapIan/t4cine/releases"><img src="https://img.shields.io/github/v/release/datapIan/t4cine?label=Latest%20Release&style=flat-square"></a>
  <a href="https://github.com/datapIan/t4cine/releases""><img src="https://img.shields.io/github/downloads/datapIan/t4cine/total?style=flat-square"></a>

## About

 - Sass' mod changed the editing game, and it's what we've all used for cinematics for as long as we can remember. I believed the same level of personalization should be in every other game. So I did it.

99% of the code was written by Sass, I take no credit for the work he has done, I just changed a few things to make it work on WAW.

## Installation

There's two types of installations for this mod. One for the *Plutonium T4* client, and one for the *Steam* client.

#### [Plutonium](https://www.plutonium.pw) (Recommended)

* Download the mod from [here](), extract and drag the "mp_t4cine" folder into your mods folder.
```text
C:/
└── .../
    └── t4/
        └── mods/
            └── mp_t4cine
```
Full path: `%localappdata%\Plutonium\storage\t4\mods`
Please note that for Plutonium mods, stats are stored as a per-mod basis.

#### WAW Steam

* * Download the mod from [here](), extract and drag the "mp_t4cine" folder into your mods folder.
```text
C:/
└── .../
    └── CodWaW/
        └── mods/
            └── mp_t4cine
```
Full path: `%localappdata%\Activision\CoDWaW\mods`

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
  

## Issues
* ***Actors*** - Currently there is no support for actors and I don't think there ever will be.

### To report bugs or feature requests, please do so through [this](https://github.com/datapIan/t4cine/issues) link.

## Credits

* [Antiga](https://github.com/mprust) - Helped with .gsc related questions.
* [Expert](https://github.com/soexperttt) - Told me I should start coding, althought I didn't technically code anything for this.
* [ReeaL](https://github.com/reaalx) - Helped with .menu related questions.
* [Sass](https://github.com/sortileges) - Wrote the original MW2 Cinematic Mod.
* [yoyo1love](https://github.com/yoyothebest) - Helped with .gsc and .menu related questions.
