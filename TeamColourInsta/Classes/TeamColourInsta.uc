/**
  * TeamColourInsta
  * Hacked together using methods from packages: Color, BTInsta, and BTPlusPlus
  * dizzy@bunnytrack.net
  *
  * Note: will only work with UT's default InstaGibDM mutator (not ZeroPing etc.)
  */

class TeamColourInsta expands Mutator;

// Import custom textures
#exec texture IMPORT NAME=BlueASMD_t3 FILE=Textures\BlueASMD_t3.pcx FLAGS=2 MIPS=OFF
#exec texture IMPORT NAME=BlueColor FILE=Textures\BlueColor.pcx FLAGS=2 MIPS=OFF
#exec texture IMPORT NAME=BlueSASMD_t3 FILE=Textures\BlueSASMD_t3.pcx FLAGS=2 MIPS=OFF
#exec texture IMPORT NAME=BlueSASMD_t4 FILE=Textures\BlueSASMD_t4.pcx FLAGS=2 MIPS=OFF
#exec texture IMPORT NAME=BlueASMDEx_a00 FILE=Textures\BlueASMDEx_a00.pcx FLAGS=2 MIPS=OFF
#exec texture IMPORT NAME=BlueASMDEx_a01 FILE=Textures\BlueASMDEx_a01.pcx FLAGS=2 MIPS=OFF
#exec texture IMPORT NAME=BlueASMDEx_a02 FILE=Textures\BlueASMDEx_a02.pcx FLAGS=2 MIPS=OFF
#exec texture IMPORT NAME=BlueASMDEx_a03 FILE=Textures\BlueASMDEx_a03.pcx FLAGS=2 MIPS=OFF
#exec texture IMPORT NAME=BlueASMDEx_a04 FILE=Textures\BlueASMDEx_a04.pcx FLAGS=2 MIPS=OFF
#exec texture IMPORT NAME=BlueASMDEx_a05 FILE=Textures\BlueASMDEx_a05.pcx FLAGS=2 MIPS=OFF
#exec texture IMPORT NAME=BlueASMDEx_a06 FILE=Textures\BlueASMDEx_a06.pcx FLAGS=2 MIPS=OFF
#exec texture IMPORT NAME=BlueASMDEx_a07 FILE=Textures\BlueASMDEx_a07.pcx FLAGS=2 MIPS=OFF
#exec texture IMPORT NAME=BlueASMDEx_a08 FILE=Textures\BlueASMDEx_a08.pcx FLAGS=2 MIPS=OFF
#exec texture IMPORT NAME=BlueASMDEx_a09 FILE=Textures\BlueASMDEx_a09.pcx FLAGS=2 MIPS=OFF
#exec texture IMPORT NAME=BlueASMDEx_a10 FILE=Textures\BlueASMDEx_a10.pcx FLAGS=2 MIPS=OFF
#exec texture IMPORT NAME=BlueASMDEx_a11 FILE=Textures\BlueASMDEx_a11.pcx FLAGS=2 MIPS=OFF
#exec texture IMPORT NAME=RedASMDEx_a00 FILE=Textures\RedASMDEx_a00.pcx FLAGS=2 MIPS=OFF
#exec texture IMPORT NAME=RedASMDEx_a01 FILE=Textures\RedASMDEx_a01.pcx FLAGS=2 MIPS=OFF
#exec texture IMPORT NAME=RedASMDEx_a02 FILE=Textures\RedASMDEx_a02.pcx FLAGS=2 MIPS=OFF
#exec texture IMPORT NAME=RedASMDEx_a03 FILE=Textures\RedASMDEx_a03.pcx FLAGS=2 MIPS=OFF
#exec texture IMPORT NAME=RedASMDEx_a04 FILE=Textures\RedASMDEx_a04.pcx FLAGS=2 MIPS=OFF
#exec texture IMPORT NAME=RedASMDEx_a05 FILE=Textures\RedASMDEx_a05.pcx FLAGS=2 MIPS=OFF
#exec texture IMPORT NAME=RedASMDEx_a06 FILE=Textures\RedASMDEx_a06.pcx FLAGS=2 MIPS=OFF
#exec texture IMPORT NAME=RedASMDEx_a07 FILE=Textures\RedASMDEx_a07.pcx FLAGS=2 MIPS=OFF
#exec texture IMPORT NAME=RedASMDEx_a08 FILE=Textures\RedASMDEx_a08.pcx FLAGS=2 MIPS=OFF
#exec texture IMPORT NAME=RedASMDEx_a09 FILE=Textures\RedASMDEx_a09.pcx FLAGS=2 MIPS=OFF
#exec texture IMPORT NAME=RedASMDEx_a10 FILE=Textures\RedASMDEx_a10.pcx FLAGS=2 MIPS=OFF
#exec texture IMPORT NAME=RedASMDEx_a11 FILE=Textures\RedASMDEx_a11.pcx FLAGS=2 MIPS=OFF
#exec texture IMPORT NAME=RedColor FILE=Textures\RedColor.pcx FLAGS=2 MIPS=OFF
#exec texture IMPORT NAME=RedSASMD_t3 FILE=Textures\RedSASMD_t3.pcx FLAGS=2 MIPS=OFF
#exec texture IMPORT NAME=RedSASMD_t4 FILE=Textures\RedSASMD_t4.pcx FLAGS=2 MIPS=OFF
#exec texture IMPORT NAME=Ring_Blue FILE=Textures\Ring_Blue.pcx FLAGS=2 MIPS=OFF
#exec texture IMPORT NAME=Ring_Red FILE=Textures\Ring_Red.pcx FLAGS=2 MIPS=OFF

var Mutator Insta;
var bool bInitialised;

function PreBeginPlay()
{

	Log("");
	Log("+--------------------------------------------------------------------+");
	Log("| Team Colour Insta                                                  |");
	Log("+--------------------------------------------------------------------+");

	if (!bInitialised) {

		Level.Game.BaseMutator.AddMutator(Self);

		Insta = Level.Spawn(class'TeamColourInstaGibDM');
		Insta.DefaultWeapon = class'TeamColourSuperShockRifle';
		Level.Game.BaseMutator.AddMutator(Insta);

		bInitialised = true;

	}
	
}

/**
  * Other methods of producing team coloured shock rifles you may wish to explore
  */

/*
simulated event PostBeginPlay()
{
	local InstaGibDM IG;

	foreach AllActors(class'InstaGibDM', IG)
	{
		IG.DefaultWeapon = class'TeamColourInsta.TeamColourSuperShockRifle';
	}

	Super.PostBeginPlay();
}

function bool CheckReplacement(Actor Other, out byte bSuperRelevant)
{
	if (Other.IsA('enforcer')) {
		return false;
	}

	if((Other.IsA('SuperShockRifle')) && !(Other.IsA('TeamColourSuperShockRifle'))) {
		Spawn(class'TeamColourSuperShockRifle',,,Other.Location,Other.rotation);
		return false;
	}
	
	return Super.CheckReplacement(Other, bSuperRelevant);
}
*/

defaultproperties
{
}