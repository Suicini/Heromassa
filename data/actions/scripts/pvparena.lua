-- pvp arena lever

function onUse(cid, item, frompos, item2, topos)

if item.uid == 7001 and item.itemid == 1945 then
player1pos = {x=819, y=735, z=9, stackpos=253}
player1 = getThingfromPos(player1pos)

player2pos = {x=830, y=735, z=9, stackpos=253}
player2 = getThingfromPos(player2pos)

if player1.itemid > 0 and player2.itemid > 0 then
arenalevel = 100
player1level = getPlayerLevel(player1.uid)
player2level = getPlayerLevel(player2.uid)

if player1level >= arenalevel and player2level >= arenalevel then
for arenax = 819,830 do
for arenay = 735,735 do
arenapos = {x=arenax, y=arenay, z=9, stackpos=253}
arenacreature = getThingfromPos(arenapos)

if arenacreature.itemid > 0 then
doPlayerSendCancel(cid,"Espere o duelo acabar.")
return 1
end
end
end

nplayer1pos = {x=821, y=735, z=9}
nplayer2pos = {x=828, y=735, z=9}

doSendMagicEffect(player1pos,2)
doSendMagicEffect(player2pos,2)

doTeleportThing(player1.uid,nplayer1pos)
doTeleportThing(player2.uid,nplayer2pos)

doSendMagicEffect(nplayer1pos,10)
doSendMagicEffect(nplayer2pos,10)

doPlayerSendTextMessage(player1.uid,18,"LUTEM!")
doPlayerSendTextMessage(player2.uid,18,"LUTEM!")
else
doPlayerSendCancel(cid,"Os dois jogadores presisam ter level 100 ou mais para poder duelar.")
end
else
doPlayerSendCancel(cid,"Voce presisa de 2 players para ter um duelo.")
end
else
return 0
end

return 1
end