SELECT u.usuario AS usuario,
COUNT(h.id_canção) AS qt_de_musicas_ouvidas,
ROUND(SUM(c.duração_segundos)/60, 2) AS total_minutos 
FROM SpotifyClone.historico_de_reproduções AS h
INNER JOIN SpotifyClone.canções AS c ON h.id_canção = c.id_canção
INNER JOIN SpotifyClone.usuarios AS u ON h.id_usuario = u.id_usuario 
GROUP BY u.usuario
ORDER BY u.usuario ASC;
