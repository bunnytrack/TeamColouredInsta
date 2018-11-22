class TeamColourSuperShockRifle expands SuperShockRifle;

simulated function PlaySelect()
{
	switch (Pawn(Owner).PlayerReplicationInfo.Team) {
		case 0:
			MultiSkins[2]=texture'TeamColourInsta.RedSASMD_t3';
			MultiSkins[3]=texture'TeamColourInsta.RedSASMD_t4';
		break;

		case 1:
			MultiSkins[2]=texture'TeamColourInsta.BlueSASMD_t3';
			MultiSkins[3]=texture'TeamColourInsta.BlueSASMD_t4';
		break;
	}

	Super.PlaySelect();
}

function ProcessTraceHit(Actor Other, Vector HitLocation, Vector HitNormal, Vector X, Vector Y, Vector Z)
{
	if (Other==None)
	{
		HitNormal = -X;
		HitLocation = Owner.Location + X*10000.0;
	}

	SpawnEffect(HitLocation, Owner.Location + CalcDrawOffset() + (FireOffset.X + 20) * X + FireOffset.Y * Y + FireOffset.Z * Z);
	
	if (Pawn(Owner).PlayerReplicationInfo.Team == 0)
		Spawn(class'RingExplosion2_Red',,, HitLocation+HitNormal*8,rotator(HitNormal));
	else if (Pawn(Owner).PlayerReplicationInfo.Team == 1)
		Spawn(class'RingExplosion2_Blue',,, HitLocation+HitNormal*8,rotator(HitNormal));

	if ( (Other != self) && (Other != Owner) && (Other != None) ) 
		Other.TakeDamage(HitDamage, Pawn(Owner), HitLocation, 60000.0*X, MyDamageType);
}


function SpawnEffect(vector HitLocation, vector SmokeLocation)
{
	local SuperShockBeam Smoke;
	local Vector DVector;
	local int NumPoints;
	local rotator SmokeRotation;

	DVector = HitLocation - SmokeLocation;
	NumPoints = VSize(DVector)/135.0;
	if ( NumPoints < 1 )
		return;
	SmokeRotation = rotator(DVector);
	SmokeRotation.roll = Rand(65535);
	
	switch (Pawn(Owner).PlayerReplicationInfo.Team) {
		case 0:
			Smoke = Spawn(class'SuperShockBeam_Red',,,SmokeLocation,SmokeRotation);
		break;

		case 1:
			Smoke = Spawn(class'SuperShockBeam_Blue',,,SmokeLocation,SmokeRotation);
		break;
	}

	Smoke.MoveAmount = DVector/NumPoints;
	Smoke.NumPuffs = NumPoints - 1;	
}

defaultproperties
{
}