--
-- ${title}
--
-- @author ${author}
-- @version ${version}
-- @date 08/01/2021

InitRoyalMod(Utils.getFilename("rmod/", g_currentModDirectory))

ToolsCombo = RoyalMod.new(r_debug_r, false)

function ToolsCombo:onValidateVehicleTypes(_, _, addSpecializationBySpecialization, _, _)
    addSpecializationBySpecialization("attacherJointsExtension", "attacherJoints")
end
