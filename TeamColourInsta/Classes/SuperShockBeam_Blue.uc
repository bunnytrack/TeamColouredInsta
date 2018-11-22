class SuperShockBeam_Blue expands SuperShockBeam;

simulated function Timer()
{
	local SuperShockBeam_Blue r;
	
	if (NumPuffs>0)
	{
		r = Spawn(class'SuperShockbeam_Blue',,,Location+MoveAmount);
		r.RemoteRole = ROLE_None;
		r.NumPuffs = NumPuffs -1;
		r.MoveAmount = MoveAmount;
	}
}

defaultproperties
{
     Texture=Texture'TeamColourInsta.BlueColor'
     Skin=Texture'TeamColourInsta.BlueColor'
}