SELECT 
    t.nome AS nome_time,
    COALESCE(SUM(CASE WHEN p.time_1 = t.id OR p.time_2 = t.id THEN 1 ELSE 0 END), 0) AS qtd_jogos,
    COALESCE(SUM(CASE WHEN p.time_1 = t.id AND p.time_1_gols = p.time_2_gols THEN 1 ELSE 0 END), 0) +
    COALESCE(SUM(CASE WHEN p.time_2 = t.id AND p.time_2_gols = p.time_1_gols THEN 1 ELSE 0 END), 0) AS qtd_empates,
    COALESCE(SUM(CASE WHEN p.time_1 = t.id AND p.time_1_gols > p.time_2_gols THEN 1 ELSE 0 END), 0) +
    COALESCE(SUM(CASE WHEN p.time_2 = t.id AND p.time_2_gols > p.time_1_gols THEN 1 ELSE 0 END), 0) AS qtd_vitorias,
    COALESCE(SUM(CASE WHEN p.time_1 = t.id AND p.time_1_gols < p.time_2_gols THEN 1 ELSE 0 END), 0) +
    COALESCE(SUM(CASE WHEN p.time_2 = t.id AND p.time_2_gols < p.time_1_gols THEN 1 ELSE 0 END), 0) AS qtd_derrotas,
    COALESCE(SUM(CASE WHEN p.time_1 = t.id AND p.time_1_gols > p.time_2_gols THEN 2 
               WHEN p.time_2 = t.id AND p.time_2_gols > p.time_1_gols THEN 2
               WHEN p.time_1 = t.id AND p.time_1_gols = p.time_2_gols THEN 1 
               WHEN p.time_2 = t.id AND p.time_2_gols = p.time_1_gols THEN 1 
               ELSE 0 END), 0) AS pontuacao_total
FROM 
    time t
LEFT JOIN 
    partida p ON p.time_1 = t.id OR p.time_2 = t.id
GROUP BY 
    t.id, t.nome
ORDER BY 
    pontuacao_total DESC;
