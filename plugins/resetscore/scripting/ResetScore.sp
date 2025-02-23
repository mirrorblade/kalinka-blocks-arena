#include <sourcemod>
#include <sdktools>

#define PLUGIN_AUTHOR	"OTTO"
#define PLUGIN_VERSION	"0.77.0"
#pragma semicolon 1

new Handle:gPluginEnabled = INVALID_HANDLE;

public Plugin:myinfo =
{
	name = "Resetscore",
	author = PLUGIN_AUTHOR,
	description = "Escribe !rs en el chat para resetear la puntuacion.",
	version = PLUGIN_VERSION,
	url = "181.177.204.129:27015"
};
public OnPluginStart()
{
	RegConsoleCmd( "say", CommandSay );
	RegConsoleCmd( "say_team", CommandSay );
	
	gPluginEnabled = CreateConVar( "otto_resetscore", "1" );
	CreateConVar( "resetscore_version", PLUGIN_VERSION, "ResetScore", FCVAR_PLUGIN | FCVAR_SPONLY | FCVAR_REPLICATED | FCVAR_NOTIFY );
}
public Action:CommandSay( id, args )
{
	decl String:Said[ 128 ];
	GetCmdArgString( Said, sizeof( Said ) - 1 );
	StripQuotes( Said );
	TrimString( Said );
	
	if( StrEqual( Said, "!rs" ) || StrEqual( Said, "!resetscore" ) )
	{
		if( GetConVarInt( gPluginEnabled ) == 0 )
		{
			PrintToChat( id, "\x03[Resetscore] The plugin is disabled." );
			PrintToConsole( id, "[Resetscore] You can't use this command when plugin is disabled!" );
		
			return Plugin_Continue;
		}

		if( GetClientDeaths( id ) == 0 && GetClientFrags( id ) == 0 )
		{
			PrintToChat( id, "\x03[Resetscore] Your score is already 0!" );
			PrintToConsole( id, "[Resetscore] You can't reset your score right now." );
			
			return Plugin_Continue;
		}
				
		SetClientFrags( id, 0 );
		SetClientDeaths( id, 0 );
	
		decl String:Name[ 32 ];
		GetClientName( id, Name, sizeof( Name ) - 1 );
	
		PrintToChat( id, "\x03[Resetscore] You have successfully reset your score!" );
		PrintToChatAll( "\x03[Resetscore] %s has just reset his score.", Name );
		PrintToConsole( id, "[Resetscore] You have successfully reset your score." );
	}
	
	return Plugin_Continue;
}	 
stock SetClientFrags( index, frags )
{
	SetEntProp( index, Prop_Data, "m_iFrags", frags );
	return 1;
}
stock SetClientDeaths( index, deaths )
{
	SetEntProp( index, Prop_Data, "m_iDeaths", deaths );
	return 1;
}

////////////////////////////////////_OTTO_\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\