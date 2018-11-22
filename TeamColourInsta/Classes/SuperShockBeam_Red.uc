class SuperShockBeam_Red expands SuperShockBeam;

simulated function Timer()
{
	local SuperShockBeam_Red r;
	
	if (NumPuffs>0)
	{
		r = Spawn(class'SuperShockBeam_Red',,,Location+MoveAmount);
		r.RemoteRole = ROLE_None;
		r.NumPuffs = NumPuffs -1;
		r.MoveAmount = MoveAmount;
	}
}

defaultproperties
{
     Texture=Texture'TeamColourInsta.RedColor'
}