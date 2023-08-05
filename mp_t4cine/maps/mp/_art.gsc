// This function should take care of grain and glow settings for each map, plus anything else that artists 
// need to be able to tweak without bothering level designers.
//#include maps\_utility; 
#include common_scripts\utility; 
#include maps\mp\_utility; 

/*
 *	Teakfog function was removed from WAW as it is from COD4.
 *	This file is here to add the function back in the game. -Forgive
 */

main()
{
	if( GetDvar( "scr_art_tweak" ) == "" || GetDvar( "scr_art_tweak" ) == "0" )
	{
		SetDvar( "scr_art_tweak", 0 ); 
	}

	if( GetDvar( "scr_dof_enable" ) == "" )
	{
		SetDvar( "scr_dof_enable", "1" ); 
	}
		
	if( GetDvar( "scr_cinematic_autofocus" ) == "" )
	{
		SetDvar( "scr_cinematic_autofocus", "1" ); 
	}

	if( GetDvar( "scr_art_visionfile" ) == "" )
	{
		SetDvar( "scr_art_visionfile", level.script ); 
	}

	if( GetDvar( "debug_reflection" ) == "" )
	{
		SetDvar( "debug_reflection", "0" ); 
	}

/#
	PrecacheModel( "test_sphere_silver" );
	level thread debug_reflection();
#/

	if( !IsDefined( level.dofDefault ) )
	{
		level.dofDefault["nearStart"] = 0; 
		level.dofDefault["nearEnd"] = 1; 
		level.dofDefault["farStart"] = 8000; 
		level.dofDefault["farEnd"] = 10000; 
		level.dofDefault["nearBlur"] = 6; 
		level.dofDefault["farBlur"] = 0; 
	}

	level.curDoF = ( level.dofDefault["farStart"] - level.dofDefault["nearEnd"] ) / 2; 
	
//	if( GetDvarInt( "scr_dof_enable" ) )
//		thread adsDoF(); 

	thread tweakart(); 
	
	if( !IsDefined( level.script ) )
	{
		level.script = tolower( GetDvar( "mapname" ) ); 
	}
	
	// Grain has been cut
	 /* 
	if( GetDvar( "r_grainfilter" ) == "" )
	{
		SetDvar( "r_grainfilter", "1" ); 
	}
	thread grain_filter(); 
	 */ 	
	
}

//grain_filter()
//{
//// Grain has been cut.
// /* 
//	//* * * * * Full screen grain filter * * * * * 
//	overlay = undefined; 
//	precacheShader( "overlay_grain" ); 
//	for( ;; )
//	{
//		if( GetDvarfloat( "r_grainfilter" ) > 0 )
//		{
//			if( !IsDefined( overlay ) )
//			{
//				overlay = newHudElem(); 
//				overlay.x = 0; 
//				overlay.y = 0; 
//				overlay setshader( "overlay_grain", 640, 480 ); 
//				overlay.alignX = "left"; 
//				overlay.alignY = "top"; 
//				overlay.horzAlign = "fullscreen"; 
//				overlay.vertAlign = "fullscreen"; 
//			}
//		}
//		else
//		{
//			if( IsDefined( overlay ) )
//				overlay destroy(); 
//		}
//		if( IsDefined( overlay ) )
//			overlay.alpha = level.grainstrength * GetDvarfloat( "r_grainfilter" ); 
//		wait 0.05; 
//	}
// */ 
//}



artfxprintln( file, string )
{
	// printing to file is optional now
	if( file == -1 )
	{
		return; 
	}
	fprintln( file, string ); 
}


// Nate - hack Fixmed and replace with proper script command call once it's fixed.
// assumes " " as the deliiter. I'm not getting fancy.  
// I would really like to go work on jeepride so here's a 
// quick function that works for now untill engineering fixes strtok.

strtok_loc( string, par1 )
{
	stringlist = []; 
	indexstring = ""; 
	for( i = 0 ; i < string.size ; i ++ )
	{
		if( string[i] == " " )
		{
			stringlist[stringlist.size] = indexstring; 
			indexstring = ""; 
		}
		else
		{
			indexstring = indexstring+string[i]; 
		}
	}
	if( indexstring.size )
	{
		stringlist[stringlist.size] = indexstring; 
	}
	return stringlist; 
}


setfogsliders()
{
	//fixme.  replace strtok_loc with strtok if it ever works properly.
	fogall = strtok_loc( GetDvar( "g_fogColorReadOnly" ), " " ) ; 
	red = fogall[0]; 
	green = fogall[1]; 
	blue = fogall[2]; 
	halfplane = GetDvar( "g_fogHalfDistReadOnly" ); 
	nearplane = GetDvar( "g_fogStartDistReadOnly" ); 
		
	if( !IsDefined( red )
		 || !IsDefined( green )
		 || !IsDefined( blue )
		 || !IsDefined( halfplane )
		 || !IsDefined( halfplane )
		 )
	{
		red = 1; 
		green = 1; 
		blue = 1; 
		halfplane = 10000001; 
		nearplane = 10000000; 
	}
	SetDvar( "scr_fog_exp_halfplane", halfplane ); 
	SetDvar( "scr_fog_nearplane", nearplane ); 
	SetDvar( "scr_fog_red", red ); 
	SetDvar( "scr_fog_green", green ); 
	SetDvar( "scr_fog_blue", blue ); 
}

tweakart()
{
	if( !IsDefined( level.tweakfile ) )
	{
		level.tweakfile = false; 
	}
	
	// blah scriptgen stuff ignore this.
	//if( level.tweakfile && level.bScriptgened )
		//script_gen_dump_addline( "maps\\createart\\" + level.script + "_art::main(); ", level.script + "_art" ); // adds to scriptgendump

	// Default values
	
	if( GetDvar( "scr_fog_red" ) == "" )
	{
		SetDvar( "scr_fog_exp_halfplane", "500" ); 
		SetDvar( "scr_fog_exp_halfheight", "500" ); 
		SetDvar( "scr_fog_nearplane", "0" ); 
		SetDvar( "scr_fog_baseheight", "0" ); 
		SetDvar( "scr_fog_red", "0.5" ); 
		SetDvar( "scr_fog_green", "0.5" ); 
		SetDvar( "scr_fog_blue", "0.5" ); 
	}

	// not in DEVGUI
	SetDvar( "scr_fog_fraction", "1.0" ); 
	SetDvar( "scr_art_dump", "0" ); 

	// update the devgui variables to current settings
	SetDvar( "scr_dof_nearStart", level.dofDefault["nearStart"] ); 
	SetDvar( "scr_dof_nearEnd", level.dofDefault["nearEnd"] ); 
	SetDvar( "scr_dof_farStart", level.dofDefault["farStart"] ); 
	SetDvar( "scr_dof_farEnd", level.dofDefault["farEnd"] ); 
	SetDvar( "scr_dof_nearBlur", level.dofDefault["nearBlur"] ); 
	SetDvar( "scr_dof_farBlur", level.dofDefault["farBlur"] ); 	

	// not in DEVGUI
	level.fogfraction = 1.0; 
	
	file = undefined; 
	filename = undefined; 
	
	// set dofvars from < levelname > _art.gsc
	//dofvarupdate(); 
	
	
	for( ;; )
	{
		while( GetDvarint( "scr_art_tweak" ) == 0 )
		{
			assertex( GetDvar( "scr_art_dump" ) == "0", "Must Enable Art Tweaks to export _art file." ); 
			wait .05; 
			if( ! GetDvarint( "scr_art_tweak" ) == 0 )
			{
				setfogsliders(); //sets the sliders to whatever the current fog value is
			}
		}
		
		
		if( GetDvarint( "scr_art_tweak_message" ) )
		{
			SetDvar( "scr_art_tweak_message", "0" ); 
			iprintlnbold( "ART TWEAK ENABLED" ); 
		}
		
		// OLD functions cuts the fog values by a fraction. not in menus
		tweakfog_fraction(); 
		
		//translate the slider values to script variables

		level.fogexphalfplane = GetDvarfloat( "scr_fog_exp_halfplane" ); 
		level.fogexphalfheight = GetDvarfloat( "scr_fog_exp_halfheight" ); 
		level.fognearplane = GetDvarfloat( "scr_fog_nearplane" ); 
		level.fogred = GetDvarfloat( "scr_fog_red" ); 
		level.foggreen = GetDvarfloat( "scr_fog_green" ); 
		level.fogblue = GetDvarfloat( "scr_fog_blue" ); 
		level.fogbaseheight = GetDvarfloat( "scr_fog_baseheight" ); 

		//dofvarupdate(); 
		
		// catch all those cases where a slider can be pushed to a place of conflict
		//fovslidercheck(); 

		//dump = dumpsettings(); // dumps and returns true if the dump dvar is set
		
		// updates fog to the variables

		if( ! GetDvarint( "scr_fog_disable" ) )
		{
			setVolFog( level.fognearplane, level.fogexphalfplane, level.fogexphalfheight, level.fogbaseheight, level.fogred, level.foggreen, level.fogblue, 0 ); 
		}
		else
		{
			setExpFog( 100000000000, 100000000001, 0, 0, 0, 0 ); // couldn't find discreet fog disabling other than to never set it in the first place
		}
		wait .1;
	} 
}

tweakfog_fraction()
{
		fogfraction = GetDvarfloat( "scr_fog_fraction" ); 
		if( fogfraction != level.fogfraction )
		{
			level.fogfraction = fogfraction; 
		}
		else
		{
			return; 
		}
			
		color = []; 
		color[0] = GetDvarfloat( "scr_fog_red" ); 
		color[1] = GetDvarfloat( "scr_fog_green" ); 
		color[2] = GetDvarfloat( "scr_fog_blue" ); 

		SetDvar( "scr_fog_fraction", 1 ); 
		if( fogfraction < 0 )
		{
			println( "no negative numbers please." ); 
			return; 
		}

		fc = []; 
		larger = 1; 
		for( i = 0; i < color.size; i ++ )
		{
			fc[i] = fogfraction * color[i]; 
			if( fc[i] > larger )
			{
				larger = fc[i]; 
			}
		}

		if( larger > 1 )
		{
			for( i = 0; i < fc.size; i ++ )
			{		
				fc[i] = fc[i] / larger; 
			}
		}

		SetDvar( "scr_fog_red", fc[0] ); 
		SetDvar( "scr_fog_green", fc[1] ); 
		SetDvar( "scr_fog_blue", fc[2] ); 

}