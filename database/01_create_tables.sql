SELECT current_database();

CREATE TABLE clientes (
	id_cliente INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	nome VARCHAR(120) NOT NULL,
	email VARCHAR(150) NOT NULL UNIQUE,
	cidade VARCHAR(100),
	estado CHAR(20),
	data_cadastro DATE NOT NULL
);

CREATE TABLE produtos (
	id_produto INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	nome_produto VARCHAR(150) NOT NULL,
	categoria VARCHAR(100) NOT NULL,
	preco NUMERIC(10,2) NOT NULL CHECK (preco >= 0),
	estoque INTEGER NOT NULL DEFAULT 0 CHECK (estoque >= 0)
);

CREATE TABLE pedidos (
	id_pedido INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	id_cliente INTEGER NOT NULL,
	data_pedido DATE NOT NULL,
	status VARCHAR(30) NOT NULL,
	valor_total	NUMERIC(10,2) NOT NULL CHECK (valor_total >= 0),
	valor_frete NUMERIC(10,2) NOT NULL CHECK (valor_frete >= 0),
	
	CONSTRAINT fk_pedidos_clientes
		FOREIGN KEY (id_cliente)
		REFERENCES clientes (id_cliente)
);

CREATE TABLE itens_pedido (
	id_item INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	id_pedido INTEGER NOT NULL,
	id_produto INTEGER NOT NULL,
	quantidade INTEGER NOT NULL CHECK (quantidade > 0),
	preco_unitario NUMERIC(10,2) NOT NULL CHECK (preco_unitario >= 0),
	
	CONSTRAINT fk_itens_pedido_pedidos
		FOREIGN KEY (id_pedido)
		REFERENCES pedidos (id_pedido),
		
	CONSTRAINT fk_itens_pedido_produtos
		FOREIGN KEY (id_produto)
		REFERENCES produtos (id_produto)
);

CREATE TABLE entregas (
	id_entrega INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	id_pedido INTEGER NOT NULL UNIQUE,
	id_produto INTEGER NOT NULL,
	transportadora VARCHAR(100) NOT NULL,
	data_envio DATE,
	data_entrega DATE,
	status_entrega VARCHAR(30) NOT NULL,
	
	CONSTRAINT fk_entregas_pedidos
	FOREIGN KEY (id_pedido)
	REFERENCES pedidos (id_pedido)
);
























