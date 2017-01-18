--[[ SCRIPTING>Linnux <scriptING ]]
 
--[[ [Advanced Reset System]
Autor: MarcelloMkez
Vers�o: 1.0
TFS: 0.3.6
Testado em: 8.60
 
[Caracter�sticas]
~ Vers�o 1.0 ~
 
- Resets no Look;
- Premium Account ou n�o;
- Mudar Voca��o;
- Limite de Resets;
- Op��es para Abilitar e Desabilitar Condi��es;
 
[Em Constru��o]
 
- Stages Free e Premium;
- 'Talvez' um novo sistema de mudar Voca��o;
sem data para postagem. ]]
 
 
 
function onSay(cid, words, param)
 
--[Configura��es de Condi��o]__
 
config = { --[[verdadeiro / Falso]]
 
needPa = false, -- Precisa de Premium Account? [true / false]
needPz = true, -- Precisa estar em Protection Zone? [true / false]
battle = true, -- Precisa estar sem Batlle para Resetar? [true / false]
withe = false, -- Players PK Withe pode Resetar? [true / false]
red = false, -- Players PK Red pode Resetar? [true / false]
tp = true, -- Teleportar para o Templo ap�s o reset? [true / false]
look = true, -- Mostrar Resets no Look do Player? [true / false]
addLimite = true, -- Abilitar Limite de Resets? [true / false]
setClasse =false, -- Mudar Voca��o do player quando resetar? [true / false]
storage = 2310, -- Storage [valor]
 
 
--[Configura��es do Reset]__
 
resetStatus = {
 
player = getPlayerGUID(cid), -- N�o Mude.
lvl = 1000 , -- Level Necess�rio para Resetar. [valor]
lvlreset = 200, -- Level que retornar� ap�s o Reset. [valor]
limite = 30, -- M�ximo de resets que um player pode chegar. [valor]
newClasse = 1, -- Id da Nova Voca��o ap�s o Reset. [valor]
tempo= 5 -- Tempo para o Player deslogar para Resetar. Em segundos. [valor]
},
}
 
--[Fun��es]__
 
function Reseting(cid)
resets = getResets(cid)
setPlayerStorageValue(cid,config.storage,resets+1)
doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
doPlayerSetVocation(cid, config.resetStatus.newClasse)
doRemoveCreature(cid)
db.query("UPDATE `players` SET `description` = ' [Reset "..resets.."]' WHERE `players`.`id` = "..config.resetStatus.player)
db.query("UPDATE `players` SET `level` = "..config.resetStatus.lvlreset..", `experience` = 0 WHERE `id` = "..config.resetStatus.player)
return TRUE
end
 
function noAll(cid)
resets = getResets(cid)
setPlayerStorageValue(cid,config.storage,resets+1)
doRemoveCreature(cid)
db.query("UPDATE `players` SET `level` = "..config.resetStatus.lvlreset..", `experience` = 0 WHERE `id` = "..config.resetStatus.player)
db.query("UPDATE `players` SET `description` = '' WHERE `players`.`id` = "..config.resetStatus.player)
return TRUE
end
 
function noTeleporting(cid)
resets = getResets(cid)
setPlayerStorageValue(cid,config.storage,resets+1)
doPlayerSetVocation(cid, config.resetStatus.newClasse)
doRemoveCreature(cid)
db.query("UPDATE `players` SET `level` = "..config.resetStatus.lvlreset..", `experience` = 0 WHERE `id` = "..config.resetStatus.player)
db.query("UPDATE `players` SET `description` = ' [Reset "..resets.."]' WHERE `players`.`id` = "..config.resetStatus.player)
return TRUE
end
 
function noLook(cid)
resets = getResets(cid)
setPlayerStorageValue(cid,config.storage,resets+1)
doPlayerSetVocation(cid, config.resetStatus.newClasse)
doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
doRemoveCreature(cid)
db.query("UPDATE `players` SET `level` = "..config.resetStatus.lvlreset..", `experience` = 0 WHERE `id` = "..config.resetStatus.player)
db.query("UPDATE `players` SET `description` = '' WHERE `players`.`id` = "..config.resetStatus.player)
return TRUE
end
 
function noClasse(cid)
resets = getResets(cid)
setPlayerStorageValue(cid,config.storage,resets+1)
doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
doRemoveCreature(cid)
db.query("UPDATE `players` SET `description` = ' [Reset "..resets.."]' WHERE `players`.`id` = "..config.resetStatus.player)
db.query("UPDATE `players` SET `level` = "..config.resetStatus.lvlreset..", `experience` = 0 WHERE `id` = "..config.resetStatus.player)
return TRUE
end
 
function setClasse(cid)
resets = getResets(cid)
setPlayerStorageValue(cid,config.storage,resets+1)
doPlayerSetVocation(cid, config.resetStatus.newClasse)
doRemoveCreature(cid)
db.query("UPDATE `players` SET `description` = '' WHERE `players`.`id` = "..config.resetStatus.player)
db.query("UPDATE `players` SET `level` = "..config.resetStatus.lvlreset..", `experience` = 0 WHERE `id` = "..config.resetStatus.player)
return TRUE
end
 
function look(cid)
resets = getResets(cid)
setPlayerStorageValue(cid,config.storage,resets+1)
doRemoveCreature(cid)
db.query("UPDATE `players` SET `description` = ' [Reset "..resets.."]' WHERE `players`.`id` = "..config.resetStatus.player)
db.query("UPDATE `players` SET `level` = "..config.resetStatus.lvlreset..", `experience` = 0 WHERE `id` = "..config.resetStatus.player)
return TRUE
end
 
function teleporting(cid)
resets = getResets(cid)
setPlayerStorageValue(cid,config.storage,resets+1)
doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
doRemoveCreature(cid)
db.query("UPDATE `players` SET `description` = '' WHERE `players`.`id` = "..config.resetStatus.player)
db.query("UPDATE `players` SET `level` = "..config.resetStatus.lvlreset..", `experience` = 0 WHERE `id` = "..config.resetStatus.player)
return TRUE
end
 
function getResets(cid)
resets = getPlayerStorageValue(cid,config.storage)
 
if resets < 0 then
resets = 0
end
return resets
 
end
 
 
local resets = getResets(cid)
local needLvl ="Voc� precisa de "..config.resetStatus.lvl-getPlayerLevel(cid).." level's para resetar."
local msg ="~~[Reset: "..getResets(cid).."]~~ 'Sucesso ao Resetar! Voc� ser� deslogado em "..config.resetStatus.tempo.." Segundos."
 
 
--[Condi�oes]__
 
if(config.needPz == true) and (getTilePzInfo(getCreaturePosition(cid)) == FALSE) then
doPlayerSendTextMessage(cid,22,"Voc� Precisa estar em Protection Zone Para Resetar.")
return TRUE
 
elseif(config.addLimite == true) and (getResets(cid) == config.resetStatus.limite) then
doPlayerSendTextMessage(cid, 22, "Voc� ja atingiu o Limite de Resets.")
return TRUE
 
elseif(config.withe == false) and (getCreatureSkullType(cid) == 3) then
doPlayerSendTextMessage(cid,22,"Voc� ta PK White, por isso n�o pode resetar.")
return TRUE
 
elseif(config.red == false) and (getCreatureSkullType(cid) == 4) then
doPlayerSendTextMessage(cid,22,"Voc� ta PK Red, por isso n�o pode resetar.")
return TRUE
 
elseif(config.needPa == true) and not isPremium(cid) then
doPlayerSendTextMessage(cid,22,"Voc� Precisa ser Premium Account para Resetar.")
return TRUE
 
elseif(config.battle == true) and (getCreatureCondition(cid, CONDITION_INFIGHT) == TRUE) then
doPlayerSendTextMessage(cid,22,"Voc� Precisa estar sem Battle para Resetar.")
return TRUE
 
elseif getPlayerLevel(cid) >= config.resetStatus.lvl and (config.tp == true) and (config.look == true) and (config.setClasse == true) then
addEvent(Reseting, config.resetStatus.tempo* 1000, cid)
 
elseif getPlayerLevel(cid) >= config.resetStatus.lvl and (config.tp == false) and (config.look == false) and (config.setClasse == false) then
addEvent(noAll, config.resetStatus.tempo* 1000, cid)
 
elseif getPlayerLevel(cid) >= config.resetStatus.lvl and (config.tp == false) and (config.look == true) and (config.setClasse == true) then
addEvent(noTeleporting, config.resetStatus.tempo* 1000, cid)
 
elseif getPlayerLevel(cid) >= config.resetStatus.lvl and (config.tp == true) and (config.look == false) and (config.setClasse == true) then
addEvent(noLook, config.resetStatus.tempo* 1000, cid)
 
elseif getPlayerLevel(cid) >= config.resetStatus.lvl and (config.tp == true) and (config.look == true) and (config.setClasse == false) then
addEvent(noClasse, config.resetStatus.tempo* 1000, cid)
 
elseif getPlayerLevel(cid) >= config.resetStatus.lvl and (config.tp == false) and (config.look == false) and (config.setClasse == true) then
addEvent(setClasse, config.resetStatus.tempo* 1000, cid)
 
elseif getPlayerLevel(cid) >= config.resetStatus.lvl and (config.tp == false) and (config.look == true) and (config.setClasse == false) then
addEvent(look, config.resetStatus.tempo* 1000, cid)
 
elseif getPlayerLevel(cid) >= config.resetStatus.lvl and (config.tp == true) and (config.look == false) and (config.setClasse == false) then
addEvent(teleporting, config.resetStatus.tempo* 1000, cid)
 
elseif doPlayerSendCancel(cid, needLvl) then
doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
return TRUE
end
 
if doPlayerPopupFYI(cid, msg) then
 
end
return TRUE
 
end