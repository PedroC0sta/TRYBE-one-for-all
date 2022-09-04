SELECT MIN(p.preço) AS faturamento_minimo, 
MAX(p.preço) AS faturamento_maximo,
ROUND(SUM(p.preço)/COUNT(u.id_usuario),2) AS faturamento_medio,
SUM(p.preço) AS faturamento_total
FROM SpotifyClone.planos AS p 
INNER JOIN SpotifyClone.usuarios AS u ON u.id_plano = p.id_plano 
