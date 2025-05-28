# Verificação da Estrutura do Repositório para Vercel

Para garantir que o seu site R.MARIN seja implementado corretamente na Vercel, verifique se o seu repositório GitHub contém a seguinte estrutura:

## Estrutura Correta do Repositório

```
rmarin-store/
├── api/
│   └── index.py                  # Ponto de entrada para a Vercel
├── src/
│   ├── models/
│   │   ├── __init__.py
│   │   └── models.py             # Definições das tabelas da base de dados
│   ├── routes/
│   │   ├── __init__.py
│   │   ├── auth.py               # Rotas de autenticação
│   │   └── store.py              # Rotas da loja
│   ├── static/
│   │   ├── images/               # Imagens dos produtos
│   │   ├── about.html            # Página Sobre Nós
│   │   ├── base.html             # Template base
│   │   ├── cart.html             # Página do carrinho
│   │   ├── catalog.html          # Página do catálogo
│   │   ├── checkout.html         # Página de checkout
│   │   ├── login.html            # Página de login
│   │   ├── order_confirmation.html # Confirmação de encomenda
│   │   └── register.html         # Página de registo
│   ├── __init__.py
│   ├── forms.py                  # Formulários Flask-WTF
│   └── main.py                   # Aplicação Flask principal
├── vercel.json                   # Configuração da Vercel
├── requirements.txt              # Dependências do projeto
├── README.md                     # Instruções de implementação
├── UPLOAD_GITHUB.md              # Guia para upload no GitHub
├── rmarin_db_structure.sql       # Estrutura MySQL original
└── rmarin_db_structure_postgres.sql # Estrutura adaptada para PostgreSQL
```

## Pontos Críticos a Verificar

1. **Arquivo `vercel.json`**: Deve estar na raiz do repositório e conter as configurações corretas para o Python e rotas estáticas.

2. **Pasta `api/`**: Deve conter o arquivo `index.py` que importa a aplicação Flask.

3. **Arquivo `requirements.txt`**: Deve estar na raiz e incluir todas as dependências necessárias, incluindo `psycopg2-binary` para PostgreSQL.

4. **Arquivo `src/main.py`**: Deve estar configurado para usar uma base de dados PostgreSQL externa através da variável de ambiente `DATABASE_URL`.

5. **Arquivos Estáticos**: Todos os templates HTML e imagens devem estar na pasta `src/static/`.

## Problemas Comuns a Evitar

- **Ambiente Virtual**: Certifique-se de que a pasta `venv/` não foi incluída no repositório.
- **Arquivos Temporários**: Remova arquivos `.pyc`, `.DS_Store` e outros arquivos temporários.
- **Chaves Secretas**: Não inclua chaves secretas ou senhas no código; use variáveis de ambiente na Vercel.
- **Caminhos Absolutos**: Evite caminhos absolutos no código; use caminhos relativos.

Após confirmar que a estrutura está correta, você pode prosseguir com a implementação na Vercel seguindo as instruções no README.md.
