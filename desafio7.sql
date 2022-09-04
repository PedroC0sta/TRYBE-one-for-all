SELECT a.artista AS artista, al.album AS album, COUNT(s.id_artista) AS seguidores 
FROM SpotifyClone.artistas AS a
INNER JOIN SpotifyClone.albuns AS al ON a.id_artista = al.id_artista
LEFT JOIN SpotifyClone.seguidores AS s ON s.id_artista = a.id_artista
GROUP BY album, artista
ORDER BY seguidores DESC, artista ASC, album ASC;
