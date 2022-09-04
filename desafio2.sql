SELECT COUNT(DISTINCT c.id_canção) AS cancoes, 
COUNT(DISTINCT a.id_artista) AS artistas, 
COUNT(DISTINCT al.id_album) AS albuns FROM SpotifyClone.canções AS c
LEFT JOIN SpotifyClone.albuns AS al ON c.id_album = al.id_album
LEFT JOIN SpotifyClone.artistas AS a ON a.id_artista = al.id_artista;
