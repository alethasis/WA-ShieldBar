function (allstates, event, ...)
    if (event == "UNIT_ABSORB_AMOUNT_CHANGED") then
        local TARGET_UNIT = "player"
        local targetGuid = UnitGUID(TARGET_UNIT)

        local totalAbsorb = UnitGetTotalAbsorbs(TARGET_UNIT)

        if (totalAbsorb and totalAbsorb > 0) then
            local maxHealth = UnitHealthMax(TARGET_UNIT)
            local clampedShields = math.min(totalAbsorb, maxHealth)

            allstates[targetGuid] = {
                show = true,
                changed = true,
                progressType = "static",
                total = maxHealth,
                totalAbsorb = totalAbsorb,
                value = clampedShields
            }

            return true
        else
            allstates[targetGuid] = {show = false, changed = true}
            return true
        end
    end
end
