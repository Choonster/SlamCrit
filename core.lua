local SPELL_IDS = { -- The spellIDs of the spells to play sounds for
-- Format:
--	[spellID] = true, -- Spell Name

	[1464] = true, -- Slam
}

-- The path to the sound file you want to play
local SOUND_FILE = "Interface\\AddOns\\SlamCrit\\crit.ogg"

-------------------
-- END OF CONFIG --
-------------------

local f = CreateFrame("Frame") -- Create a frame
f:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED") -- Tell it to watch for this event
f:SetScript("OnEvent", function(self, event, ...)
	self[event](self, ...) -- When an event fires, call the method with the same name as the event
end)

-- When the COMBAT_LOG_EVENT_UNFILTERED events is fired, this method is called
function f:COMBAT_LOG_EVENT_UNFILTERED(timestamp, event, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags, ...)
	-- If it was a SPELL_DAMAGE event,
	if event == "SPELL_DAMAGE" then
		local spellID, spellName, spellSchool, amount, overkill, school, resisted, blocked, absorbed, critical = ... -- Assign local variables to the extra arguments of the event
		-- If the spell cast was Slam and it was a critical strike then
		if SLAM_IDs[spellID] and critical then
			PlaySoundFile(SOUND_FILE) -- Play the sound file
		end
	end
end
