class RingExplosion2_Red expands RingExplosion_Red;

simulated function PreBeginPlay()
{
	bExtraEffectsSpawned = false;
}

simulated function SpawnExtraEffects()
{
	local actor a;

	bExtraEffectsSpawned = true;
	a = Spawn(class'ShockExplo_Red');
	a.RemoteRole = ROLE_None;

	Spawn(class'EnergyImpact');

	if ( Level.bHighDetailMode && !Level.bDropDetail )
	{
		a = Spawn(class'RingExplosion_Red');
		a.RemoteRole = ROLE_None;
	}
}

defaultproperties
{
}