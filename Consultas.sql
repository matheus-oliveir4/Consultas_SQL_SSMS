-- Consulta 
-- Top 3 Produtos que  tiveram Maior Quantidade de Vendas no mês de setembro de 1996
use EMPRESA_DB
select TOP 5 PR.Descricao, SUM(D.quantidade) total from TB_PRODUTO as PR
join TB_DETALHE_PEDIDO as D ON PR.ProdutoId= d.ProdutoId 
join TB_PEDIDO as P ON D.NumeroPedido = P.NumeroPedido
where P.DataPedido Between '1996-07-01' and '1996-07-31'
group by PR.Descricao
Order BY SUM(D.QUantidade) desc

-- Top 3 Clientes que tiveram maior gasto no mês de setembro de 1996
select top 5 C.NomeCompleto, SUM(DP.Preco) total from TB_CLIENTE as C
join TB_PEDIDO as P ON C.ClienteId = P.ClienteId
join TB_DETALHE_PEDIDO as DP ON p.NumeroPedido = DP.NumeroPedido
WHERE P.DataPedido between '1996-07-01' and '1996-07-31'
Group By C.NomeCompleto 
Order By Sum(DP.Preco) Desc

-- Lista de Paises Que mais Gastarm na Categoria Bebidas
select Top 5 e.Pais, Sum(P.Preco*P.Unidades) Valor from TB_ENDERECO as E
join TB_FORNECEDOR as F ON E.FornecedorId = F.FornecedorId
join TB_PRODUTO as P ON F.FornecedorId = P.FornecedorId
join TB_CATEGORIA as C ON P.CategoriaId = c.CategoriaId
Where C.Descricao = 'Bebidas'
Group By E.Pais
Order by SUM(P.Preco*P.Unidades) Desc

-- Lista de Todos os Clientes Que Compram Produtos da Categoria Bebida
Select Top 5 C.NomeCompleto, PR.Unidades, pr.Preco*Pr.Unidades ValorGasto, TC.Descricao from TB_CLIENTE as C
join TB_PEDIDO as P ON C.ClienteId = P.ClienteId
join TB_DETALHE_PEDIDO as DP ON P.NumeroPedido = DP.NumeroPedido
join TB_PRODUTO as PR ON DP.ProdutoId = PR.ProdutoId
join TB_CATEGORIA as TC ON PR.CategoriaId = TC.CategoriaId
where TC.Descricao = 'Bebidas'




