local SLAM_IDs = { -- The spellIDs of Slam
	[1464] = true, -- This is the spellID Wowhead lists as being the Warrior version of the spell
	[50782] = true, -- This is the spellID that appears to be used for SPELL_DAMAGE events, as shown by Øak's testing
}

local SOUND_FILE = "Interface\\AddOns\\SlamCrit\\crit.ogg" -- The path to the sound fiole you want to play


local f = CreateFrame("Frame") -- Create a frame
f:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED") -- Tell it to watch for this event
f:SetScript("OnEvent", function(self, _, ...) -- Tell it what to do each time the event is fired
	local timestamp, event, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags,
		destGUID, destName, destFlags, destRaidFlags, spellId, spellName, spellSchool, amount,
		overkill, school, resisted, blocked, absorbed, critical = ... -- Assign local variables to the arguments of the event
	
--  If it was a SPELL_DAMAGE event, the spell cast was Slam and it was a critical strike then
	if 	event == "SPELL_DAMAGE"   and 	SLAM_IDs[spellId] 	and critical then
		PlaySoundFile(SOUND_FILE) -- Play the sound file
	end
end)