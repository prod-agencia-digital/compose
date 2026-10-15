-- O upstream tambem grava app.settings.jwt_secret no banco, a partir do JWT_SECRET. Removido de
-- proposito: era uma copia em repouso do segredo HS256, legivel por current_setting() a qualquer
-- papel, e nenhuma funcao a le (CraftLoop, 2026-10-15). So roda na criacao do banco; nos bancos
-- existentes a copia sai por ALTER DATABASE ... RESET.
\set jwt_exp `echo "$JWT_EXP"`

ALTER DATABASE postgres SET "app.settings.jwt_exp" TO :'jwt_exp';
