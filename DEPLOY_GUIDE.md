# Guia de Deploy da Base de Dados PostgreSQL e Projeto na Vercel

Este guia fornece instruções detalhadas para configurar uma base de dados PostgreSQL externa e implementar o projeto R.MARIN na Vercel.

## 1. Configuração da Base de Dados PostgreSQL

Para a loja R.MARIN funcionar na Vercel, é necessário usar uma base de dados PostgreSQL externa. Recomendamos o Supabase por ser fácil de usar e oferecer um plano gratuito generoso.

### 1.1. Criar uma Base de Dados no Supabase

1. Acesse [Supabase](https://supabase.com/) e crie uma conta gratuita (pode usar sua conta GitHub)
2. Clique em "New Project"
3. Dê um nome ao projeto (ex: "rmarin-store")
4. Defina uma senha forte para a base de dados
5. Escolha a região mais próxima de Portugal (ex: "West Europe")
6. Clique em "Create new project"
7. Aguarde a criação do projeto (pode levar alguns minutos)

### 1.2. Configurar a Base de Dados

1. No painel do Supabase, vá para "SQL Editor"
2. Clique em "New Query"
3. Copie e cole o conteúdo do arquivo `rmarin_db_structure_postgres.sql`
4. Clique em "Run" para criar as tabelas

### 1.3. Obter a String de Conexão

1. No painel do Supabase, vá para "Settings" (ícone de engrenagem) > "Database"
2. Role para baixo até "Connection string"
3. Selecione "URI" no menu suspenso
4. Clique em "Copy" para copiar a string de conexão
5. Substitua `[YOUR-PASSWORD]` na string pela senha que você definiu ao criar o projeto

Guarde esta string de conexão (DATABASE_URL) para usar nas variáveis de ambiente da Vercel.

## 2. Deploy do Projeto na Vercel

Depois de configurar a base de dados e fazer o upload dos arquivos para o GitHub, siga estas etapas para implementar o projeto na Vercel:

### 2.1. Criar uma Conta na Vercel

1. Acesse [Vercel](https://vercel.com/) e crie uma conta gratuita (recomendamos usar sua conta GitHub para facilitar a integração)

### 2.2. Importar o Projeto do GitHub

1. No painel da Vercel, clique em "Add New" > "Project"
2. Na seção "Import Git Repository", encontre e selecione o repositório `rmarin-store`
3. Clique em "Import"

### 2.3. Configurar o Projeto

Na página de configuração do projeto:

1. **Framework Preset:** Selecione "Other"
2. **Root Directory:** Deixe como está (/)
3. **Build Command:** Deixe em branco (será usado o vercel.json)
4. **Output Directory:** Deixe em branco

### 2.4. Configurar Variáveis de Ambiente

Clique em "Environment Variables" e adicione as seguintes variáveis:

1. **DATABASE_URL**
   - Nome: `DATABASE_URL`
   - Valor: Cole a string de conexão do Supabase que você copiou anteriormente
   
2. **FLASK_SECRET_KEY**
   - Nome: `FLASK_SECRET_KEY`
   - Valor: Uma chave secreta longa e aleatória (pode gerar uma em [randomkeygen.com](https://randomkeygen.com/))
   
3. **STRIPE_PUBLIC_KEY**
   - Nome: `STRIPE_PUBLIC_KEY`
   - Valor: Sua chave pública do Stripe (pode usar uma chave de teste)
   
4. **STRIPE_SECRET_KEY**
   - Nome: `STRIPE_SECRET_KEY`
   - Valor: Sua chave secreta do Stripe (pode usar uma chave de teste)

### 2.5. Iniciar o Deploy

1. Clique no botão "Deploy"
2. Aguarde a conclusão do processo de build e deploy (pode levar alguns minutos)
3. Quando concluído, você receberá um URL para acessar seu site (ex: `https://rmarin-store.vercel.app`)

## 3. Configurar Domínio Personalizado (rmarin.pt)

Se você possui o domínio `rmarin.pt` e deseja usá-lo para seu site:

1. No painel da Vercel, selecione seu projeto
2. Vá para "Settings" > "Domains"
3. Digite `rmarin.pt` no campo e clique em "Add"
4. Siga as instruções da Vercel para configurar os registros DNS:
   - Você precisará acessar o painel de controle do seu provedor de domínio
   - Adicione os registros DNS conforme indicado pela Vercel (geralmente um registro A ou CNAME)
   - Aguarde a propagação dos DNS (pode levar até 48 horas, mas geralmente é mais rápido)

## 4. Verificação Final

Após o deploy, verifique se:

1. O site está acessível pelo URL da Vercel
2. O registo de utilizadores funciona
3. O login funciona
4. O catálogo de produtos é exibido
5. É possível adicionar produtos ao carrinho
6. O checkout funciona (teste com o modo de teste do Stripe)

## 5. Solução de Problemas Comuns

### 5.1. Erro de Conexão com a Base de Dados

- Verifique se a string de conexão `DATABASE_URL` está correta
- Confirme se as tabelas foram criadas corretamente no Supabase
- Verifique se o IP da Vercel não está bloqueado nas configurações do Supabase

### 5.2. Erro 500 ou Falha no Build

- Verifique os logs de build e deploy na dashboard da Vercel
- Confirme se todas as dependências estão listadas no `requirements.txt`
- Verifique se a estrutura do projeto está correta conforme o arquivo `VERIFICACAO_ESTRUTURA.md`

### 5.3. Problemas com Pagamentos Stripe

- Confirme se as chaves do Stripe estão corretas
- Verifique se está usando o modo de teste do Stripe para testes
- Teste com os cartões de teste fornecidos pelo Stripe

## 6. Manutenção e Atualizações

Para atualizar seu site:

1. Faça as alterações nos arquivos locais
2. Faça upload das alterações para o GitHub
3. A Vercel detectará automaticamente as alterações e fará um novo deploy

Lembre-se de que a Vercel oferece 100 deploys gratuitos por mês no plano Hobby, o que é mais que suficiente para a maioria dos casos de uso.
