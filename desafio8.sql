SELECT a.artista AS artista, al.album AS album  FROM SpotifyClone.artistas AS a
INNER JOIN SpotifyClone.albuns AS al ON a.id_artista = al.id_artista
WHERE artista = "Elis Regina";
