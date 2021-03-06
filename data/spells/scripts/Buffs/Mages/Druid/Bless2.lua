local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_SOUND_GREEN)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, 0)

local condition = createConditionObject(CONDITION_REGENERATION)
setConditionParam(condition, CONDITION_PARAM_BUFF, 1)
setConditionParam(condition, CONDITION_PARAM_SUBID, 2)
setConditionParam(condition, CONDITION_PARAM_TICKS, 5 * 60 * 1000)
setConditionParam(condition, CONDITION_PARAM_MANAGAIN, 30)
setConditionParam(condition, CONDITION_PARAM_MANATICKS, 1000)
setCombatCondition(combat, condition)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
