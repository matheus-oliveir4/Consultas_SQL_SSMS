# Consultas_SQL_SSMS
Consultas em SQL para realização de analise assertivas.

-- Nesse projeto realizei algumas Consultas para criar indicadores interessantes a serem analisados. <br>
-- Fiz uso de clausula como JOiN, GROUP BY, ORDER BY e WHERE que proporcionam analises mais assertivas.<br>

-- Agora Veja os resultados: <br>

*Aparti do Esquema de relacionamento abaixo* <br>
<img src="https://github.com/matheus-oliveir4/Consulta_SQL_SSMS/blob/main/Esquema_Realacional.PNG" alt=" esquemas" width = 800px> <br>

## *Veja os resultados:*

Questionamentos:  
*-Top 5 Produtos que  tiveram Maior Quantidade de Vendas no mês de setembro de 1996* <br>
*-Top 5 Clientes que tiveram maior gasto no mês de setembro de 1996* <br>
*-Lista de Paises Que mais Gastarm na Categoria Bebidas* <br>
*-Lista de Todos os Clientes Que Compram Produtos da Categoria Bebida* <br>


*Consulta*

    -- Top 5 Produtos que  tiveram Maior Quantidade de Vendas no mês de setembro de 1996*
    
    use EMPRESA_DB
    SELECT 
    	TOP 5 PR.Descricao, 
    	SUM(D.quantidade) total 
    from TB_PRODUTO as PR
    	join 
    		TB_DETALHE_PEDIDO as D ON PR.ProdutoId= d.ProdutoId 
    	join 
    		TB_PEDIDO as P ON D.NumeroPedido = P.NumeroPedido
    	WHERE 
    		P.DataPedido Between '1996-07-01' and '1996-07-31'
    	group by 
    		PR.Descricao
    	Order BY 
    		SUM(D.QUantidade) desc
      
    -- Top 5 Clientes que tiveram maior gasto no mês de setembro de 1996
    
    SELECT 
    	top 5 C.NomeCompleto, 
    	SUM(DP.Preco) total
    From 
    	TB_CLIENTE as C
    	join
    		TB_PEDIDO as P ON C.ClienteId = P.ClienteId
    	join 
    		TB_DETALHE_PEDIDO as DP ON p.NumeroPedido = DP.NumeroPedido
    	WHERE
    		P.DataPedido between '1996-07-01' and '1996-07-31'
    	Group By
    		C.NomeCompleto 
    	Order By 
    		Sum(DP.Preco) Desc

     -- Lista de Paises Que mais Gastarm na Categoria Bebidas
    
    SELECT
    	Top 5 e.Pais, 
    	Sum(P.Preco*P.Unidades) Valor 
    From TB_ENDERECO as E
    	join 
    		TB_FORNECEDOR as F ON E.FornecedorId = F.FornecedorId
    	join 
    		TB_PRODUTO as P ON F.FornecedorId = P.FornecedorId
    	join 
    		TB_CATEGORIA as C ON P.CategoriaId = c.CategoriaId
    	WHERE
    		C.Descricao = 'Bebidas'
    	Group By 
    		E.Pais
    	Order by 
    		SUM(P.Preco*P.Unidades) Desc
    
     --Lista de Todos os Clientes Que Compram Produtos da Categoria Bebida
    
      SELECT
      	Top 5 C.NomeCompleto, 
      	PR.Unidades, 
      	pr.Preco*Pr.Unidades ValorGasto, 
      	TC.Descricao 
      From TB_CLIENTE as C
      	join 
      		TB_PEDIDO as P ON C.ClienteId = P.ClienteId
      	join 
      		TB_DETALHE_PEDIDO as DP ON P.NumeroPedido = DP.NumeroPedido
      	join 
      		TB_PRODUTO as PR ON DP.ProdutoId = PR.ProdutoId
      	join 
      		TB_CATEGORIA as TC ON PR.CategoriaId = TC.CategoriaId
      	WHERE 
      		TC.Descricao = 'Bebidas'



*Resultados*

<img src="https://github.com/matheus-oliveir4/Consultas_SQL_SSMS/blob/main/03_Resultado_Consultas.PNG" alt=" Consultas" width = 800px>
