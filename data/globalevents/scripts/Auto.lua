
function onThink(interval, lastExecution)
-- Configura��es
local cor = 22 -- Defina a cor da mensagem (22 = branco)
local mensagens ={
[[Como comprar skills? Saiba usando !notice... Quer falar com todos? use o comando !service e estipule um pre�o!!
]]
}

-- Fim de Configura��es

doBroadcastMessage(mensagens[math.random(1,table.maxn(mensagens))], cor)
return TRUE
end