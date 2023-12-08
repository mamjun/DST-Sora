require("stategraphs/commonstates")
local events = {CommonHandlers.OnSleepEx(), CommonHandlers.OnWakeEx(), EventHandler("soratowork", function(inst)
    inst.sg:GoToState("work")
end),EventHandler("soratoeat", function(inst)
    inst.sg:GoToState("playful4")
end)}
local actionhandlers = {}
local states = {State {
    name = "idle",
    tags = {"idle", "canrotate"},

    onenter = function(inst, pushanim)
        inst.AnimState:PlayAnimation("idle_loop")
    end,

    events = {EventHandler("animover", function(inst)
        if inst.AnimState:AnimDone() then
            local r = math.random()
            local emote_idle_chance = 0.3
            if r < emote_idle_chance then
                inst.sg:GoToState("playful" .. math.random(inst.hat and 6 or 87))
            else
                inst.sg:GoToState("idle")
            end
        end
    end)}
},State {
    name = "work",
    tags = {"busy", "canrotate"},

    onenter = function(inst, pushanim)
        inst.AnimState:PlayAnimation("sleep_pre")
    end,
    timeline = {
		TimeEvent(1.1, function(inst) --0.5秒之后触发动作 可以取消后摇
			inst.sg:GoToState("idle")
		end),}

}}

CommonStates.AddSimpleState(states, "playful1", "emote_nuzzle", {"idle", "canrotate"})
CommonStates.AddSimpleState(states, "playful2", "jump_out", {"idle", "canrotate"})
CommonStates.AddSimpleState(states, "playful3", "emote_stretch", {"idle", "canrotate"})
CommonStates.AddSimpleState(states, "playful4", "emote_lick", {"idle", "canrotate"})
CommonStates.AddSimpleState(states, "playful5", "emote_playful", {"idle", "canrotate"})
CommonStates.AddSimpleState(states, "playful6", "interact_passive", {"idle", "canrotate"})
CommonStates.AddSimpleState(states, "playful7", "interact_active", {"idle", "canrotate"})

CommonStates.AddSleepExStates(states)
return StateGraph("SGcritter_kitten", states, events, "idle", actionhandlers)
