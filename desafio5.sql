SELECT c.canção AS cancao, 
COUNT(h.id_canção) AS reproducoes
FROM SpotifyClone.historico_de_reproduções AS h
INNER JOIN SpotifyClone.canções AS c ON c.id_canção = h.id_canção 
GROUP BY  c.canção 
ORDER BY reproducoes DESC, cancao asc  LIMIT 2;
