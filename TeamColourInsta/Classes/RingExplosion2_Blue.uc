class RingExplosion2_Blue expands RingExplosion_Blue;

simulated function PreBeginPlay()
{
	bExtraEffectsSpawned = false;
}

simulated function SpawnExtraEffects()
{
	local actor a;

	bExtraEffectsSpawned = true;
	a = Spawn(class'ShockExplo_Blue');
	a.RemoteRole = ROLE_None;

	Spawn(class'EnergyImpact');

	if ( Level.bHighDetailMode && !Level.bDropDetail )
	{
		a = Spawn(class'RingExplosion_Blue');
		a.RemoteRole = ROLE_None;
	}
}

defaultproperties
{
}