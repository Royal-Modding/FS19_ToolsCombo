--
-- ${title}
--
-- @author ${author}
-- @version ${version}
-- @date 08/01/2021

InitRoyalMod(Utils.getFilename("rmod/", g_currentModDirectory))

ToolsCombo = RoyalMod.new(r_debug_r, false)

function ToolsCombo:initialize()
end

function ToolsCombo:onValidateVehicleTypes(vehicleTypeManager, addSpecialization, addSpecializationBySpecialization, addSpecializationByVehicleType, addSpecializationByFunction)
    addSpecializationBySpecialization("attacherJointsExtension", "attacherJoints")
end

function ToolsCombo:onMissionInitialize(baseDirectory, missionCollaborators)
end

function ToolsCombo:onSetMissionInfo(missionInfo, missionDynamicInfo)
end

function ToolsCombo:onLoad()
end

function ToolsCombo:onPreLoadMap(mapFile)
end

function ToolsCombo:onCreateStartPoint(startPointNode)
end

function ToolsCombo:onLoadMap(mapNode, mapFile)
end

function ToolsCombo:onPostLoadMap(mapNode, mapFile)
end

function ToolsCombo:onLoadSavegame(savegameDirectory, savegameIndex)
end

function ToolsCombo:onPreLoadVehicles(xmlFile, resetVehicles)
end

function ToolsCombo:onPreLoadItems(xmlFile)
end

function ToolsCombo:onPreLoadOnCreateLoadedObjects(xmlFile)
end

function ToolsCombo:onLoadFinished()
end

function ToolsCombo:onStartMission()
end

function ToolsCombo:onMissionStarted()
end

function ToolsCombo:onWriteStream(streamId)
end

function ToolsCombo:onReadStream(streamId)
end

function ToolsCombo:onUpdate(dt)
end

function ToolsCombo:onUpdateTick(dt)
end

function ToolsCombo:onWriteUpdateStream(streamId, connection, dirtyMask)
end

function ToolsCombo:onReadUpdateStream(streamId, timestamp, connection)
end

function ToolsCombo:onMouseEvent(posX, posY, isDown, isUp, button)
end

function ToolsCombo:onKeyEvent(unicode, sym, modifier, isDown)
end

function ToolsCombo:onDraw()
end

function ToolsCombo:onPreSaveSavegame(savegameDirectory, savegameIndex)
end

function ToolsCombo:onPostSaveSavegame(savegameDirectory, savegameIndex)
end

function ToolsCombo:onPreDeleteMap()
end

function ToolsCombo:onDeleteMap()
end
