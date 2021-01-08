--
-- ${title}
--
-- @author ${author}
-- @version ${version}
-- @date 08/01/2021

AttacherJointsExtension = {}
AttacherJointsExtension.MOD_NAME = g_currentModName
AttacherJointsExtension.SPEC_TABLE_NAME = string.format("spec_%s.attacherJointsExtension", AttacherJointsExtension.MOD_NAME)

function AttacherJointsExtension.initSpecialization()
    Vehicle.registerStateChange("TURN_ON_ALL_IMPLEMENTS")
    Vehicle.registerStateChange("UNFOLD_ALL_IMPLEMENTS")
end

function AttacherJointsExtension.prerequisitesPresent(specializations)
    return true
end

function AttacherJointsExtension.registerEvents(vehicleType)
end

function AttacherJointsExtension.registerFunctions(vehicleType)
    --SpecializationUtil.registerFunction(vehicleType, "getHasAttacherJointsExtension", AttacherJointsExtension.getHasAttacherJointsExtension)
end

function AttacherJointsExtension.registerEventListeners(vehicleType)
    SpecializationUtil.registerEventListener(vehicleType, "onPreLoad", AttacherJointsExtension)
    SpecializationUtil.registerEventListener(vehicleType, "onPostLoad", AttacherJointsExtension)
    SpecializationUtil.registerEventListener(vehicleType, "onRegisterActionEvents", AttacherJointsExtension)
    SpecializationUtil.registerEventListener(vehicleType, "onStateChange", AttacherJointsExtension)
end

function AttacherJointsExtension:onPreLoad(savegame)
    local spec = self[AttacherJointsExtension.SPEC_TABLE_NAME]
end

function AttacherJointsExtension:onPostLoad(savegame)
    local spec = self[AttacherJointsExtension.SPEC_TABLE_NAME]
end

function AttacherJointsExtension:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection)
    if self.isClient then
        local spec = self[AttacherJointsExtension.SPEC_TABLE_NAME]
        self:clearActionEventsTable(spec.actionEvents)

        if isActiveForInputIgnoreSelection then
            if #self.spec_attacherJoints.attacherJoints > 0 then
                local _, actionEventId = self:addActionEvent(spec.actionEvents, InputAction.TOOLSCOMBO_TURN_ON_ALL_IMPLEMENTS, self, AttacherJointsExtension.actionEventTurnOnAllImplements, false, true, false, true, nil, nil, true)
                g_inputBinding:setActionEventTextVisibility(actionEventId, false)

                _, actionEventId = self:addActionEvent(spec.actionEvents, InputAction.TOOLSCOMBO_UNFOLD_ALL_IMPLEMENTS, self, AttacherJointsExtension.actionEventUnfoldAllImplements, false, true, false, true, nil, nil, true)
                g_inputBinding:setActionEventTextVisibility(actionEventId, false)
            end
        end
    end
end

function AttacherJointsExtension:onStateChange(state, data)
    if state == Vehicle.STATE_CHANGE_TURN_ON_ALL_IMPLEMENTS then
        if self.getCanToggleTurnedOn ~= nil then
            TurnOnVehicle.actionEventTurnOn(self)
        end
    end
    if state == Vehicle.STATE_CHANGE_UNFOLD_ALL_IMPLEMENTS then
        if self.getIsFoldAllowed ~= nil then
            Foldable.actionEventFold(self)
        end
    end
end

function AttacherJointsExtension.actionEventTurnOnAllImplements(self, actionName, inputValue, callbackState, isAnalog)
    self:getRootVehicle():raiseStateChange(Vehicle.STATE_CHANGE_TURN_ON_ALL_IMPLEMENTS)
end

function AttacherJointsExtension.actionEventUnfoldAllImplements(self, actionName, inputValue, callbackState, isAnalog)
    self:getRootVehicle():raiseStateChange(Vehicle.STATE_CHANGE_UNFOLD_ALL_IMPLEMENTS)
end
