local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_GROUNDSHAKER)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, 0)

local condition = createConditionObject(CONDITION_REGENERATION)
setConditionParam(condition, CONDITION_PARAM_BUFF, 1)
setConditionParam(condition, CONDITION_PARAM_SUBID, 1)
setConditionParam(condition, CONDITION_PARAM_TICKS, 5 * 60 * 1000000)
setConditionParam(condition, CONDITION_PARAM_HEALTHGAIN, 2000)
setConditionParam(condition, CONDITION_PARAM_HEALTHTICKS, 2)
setConditionParam(condition, CONDITION_PARAM_MANAGAIN, 10000)
setConditionParam(condition, CONDITION_PARAM_MANATICKS, 2)
setCombatCondition(combat, condition)

local condition2 = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition2, CONDITION_PARAM_BUFF, 1)
setConditionParam(condition2, CONDITION_PARAM_SUBID, 2)
setConditionParam(condition2, CONDITION_PARAM_TICKS, 5 * 60 * 1000000)
setConditionParam(condition2, CONDITION_PARAM_SKILL_MELEE, 100)
setConditionParam(condition2, CONDITION_PARAM_SKILL_SHIELD, 100)
setConditionParam(condition2, CONDITION_PARAM_SKILL_DISTANCE, 100)
setConditionParam(condition2, CONDITION_PARAM_STAT_MAGICPOINTS, 1000)
setConditionParam(condition2, CONDITION_PARAM_STAT_MAXMANAPERCENT, 150)
setConditionParam(condition2, CONDITION_PARAM_STAT_MAXHEALTHPERCENT, 150)
setCombatCondition(combat, condition2)

local condition3 = createConditionObject(CONDITION_LIGHT)
setConditionParam(condition3, CONDITION_PARAM_BUFF, 1)
setConditionParam(condition3, CONDITION_PARAM_SUBID, 3)
setConditionParam(condition3, CONDITION_PARAM_TICKS, 5 * 60 * 100000)
setConditionParam(condition3, CONDITION_PARAM_LIGHT_LEVEL, 6)
setConditionParam(condition3, CONDITION_PARAM_LIGHT_COLOR, 33296)
setCombatCondition(combat, condition3)

local condition4 = createConditionObject(CONDITION_REGENERATION)
setConditionParam(condition4, CONDITION_PARAM_BUFF, 1)
setConditionParam(condition4, CONDITION_PARAM_SUBID, 4)
setConditionParam(condition4, CONDITION_PARAM_TICKS, 5 * 60 * 100000)
setConditionParam(condition4, CONDITION_PARAM_HEALTHGAIN, 15000)
setConditionParam(condition4, CONDITION_PARAM_HEALTHTICKS, 8)
setCombatCondition(combat, condition4)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end