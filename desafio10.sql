SELECT c.canção AS nome, 
COUNT(h.id_canção) AS reproducoes
FROM SpotifyClone.canções AS c
INNER JOIN SpotifyClone.historico_de_reproduções AS h
ON c.id_canção = h.id_canção
WHERE h.id_usuario = ANY ( SELECT id_usuario FROM SpotifyClone.usuarios
where id_plano = 1 OR id_plano = 4)
GROUP BY nome
ORDER BY nome ASC;
