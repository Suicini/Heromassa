
function onThink(interval, lastExecution)
-- Configura��es
local cor = 22 -- Defina a cor da mensagem (22 = branco)
local mensagens ={
[[Pessoal Para Saber como Comprar Skills Digite !notice....Tem Comando !service,Ex: !service Escreve Alguma Coisa Aqui,0)


]]
}

-- Fim de Configura��es

doBroadcastMessage(mensagens[math.random(1,table.maxn(mensagens))], cor)
return TRUE
end