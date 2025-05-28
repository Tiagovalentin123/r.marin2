# Loja Online R.MARIN - Instruções para Vercel

Este ficheiro contém as instruções para configurar e implementar a aplicação da loja online R.MARIN na plataforma Vercel.

## 1. Pré-requisitos

* Uma conta GitHub (gratuita) para armazenar o código
* Uma conta Vercel (gratuita) para alojar o site
* Uma base de dados PostgreSQL externa (recomendamos Supabase, Railway ou Neon)
* Conta Stripe para processamento de pagamentos (pode usar o modo de teste)

## 2. Estrutura do Projeto

Este projeto foi adaptado especificamente para funcionar na Vercel:

* `api/index.py` - Ponto de entrada para a Vercel
* `vercel.json` - Configuração da Vercel
* `src/` - Código da aplicação Flask
* `requirements.txt` - Dependências do projeto

## 3. Base de Dados

A Vercel não suporta bases de dados MySQL locais. É necessário usar uma base de dados PostgreSQL externa:

* **Opções recomendadas:**
  * [Supabase](https://supabase.com/) (tem plano gratuito)
  * [Railway](https://railway.app/) (tem plano gratuito)
  * [Neon](https://neon.tech/) (tem plano gratuito)
  * [ElephantSQL](https://www.elephantsql.com/) (tem plano gratuito)

Depois de criar a base de dados, guarde a string de conexão (DATABASE_URL) para usar nas variáveis de ambiente da Vercel.

## 4. Passos para Implementação

### 4.1. Criar um Repositório no GitHub

1. Aceda a [GitHub](https://github.com/) e faça login
2. Clique no botão "+" no canto superior direito e selecione "New repository"
3. Dê um nome ao repositório (ex: `rmarin-store`)
4. Deixe-o público e não inicialize com README
5. Clique em "Create repository"

### 4.2. Fazer Upload dos Ficheiros para o GitHub

**Opção 1: Usando a Interface Web do GitHub (mais fácil)**

1. No seu novo repositório, clique no link "uploading an existing file"
2. Arraste todos os ficheiros e pastas deste projeto para a área de upload
3. Adicione uma mensagem de commit como "Versão inicial da loja R.MARIN"
4. Clique em "Commit changes"

**Opção 2: Usando Git (para utilizadores avançados)**

```bash
git clone https://github.com/SEU_USUARIO/rmarin-store.git
# Copie todos os ficheiros para a pasta clonada
cd rmarin-store
git add .
git commit -m "Versão inicial da loja R.MARIN"
git push origin main
```

### 4.3. Implementar na Vercel

1. Aceda a [Vercel](https://vercel.com/) e faça login (pode usar a sua conta GitHub)
2. Clique em "Add New" e selecione "Project"
3. Encontre e selecione o repositório `rmarin-store` que acabou de criar
4. Na página de configuração:
   * **Framework Preset:** Selecione "Other"
   * **Root Directory:** Deixe como está (/)
   * **Build Command:** Deixe em branco (será usado o vercel.json)
   * **Output Directory:** Deixe em branco

5. **Variáveis de Ambiente:** Clique em "Environment Variables" e adicione:
   * `DATABASE_URL` - A string de conexão da sua base de dados PostgreSQL
   * `FLASK_SECRET_KEY` - Uma chave secreta longa e aleatória (ex: gere uma em [randomkeygen.com](https://randomkeygen.com/))
   * `STRIPE_PUBLIC_KEY` - A sua chave pública do Stripe
   * `STRIPE_SECRET_KEY` - A sua chave secreta do Stripe

6. Clique em "Deploy"

A Vercel irá construir e implementar a sua aplicação. Quando terminar, você receberá um URL para aceder ao seu site (ex: `https://rmarin-store.vercel.app`).

### 4.4. Configurar Domínio Personalizado (Opcional)

Se tiver o domínio `rmarin.pt`:

1. Na dashboard da Vercel, selecione o seu projeto
2. Vá para "Settings" > "Domains"
3. Adicione o domínio `rmarin.pt`
4. Siga as instruções da Vercel para configurar os registos DNS no seu provedor de domínio

## 5. Manutenção e Atualizações

Para atualizar o site:

1. Faça as alterações nos ficheiros locais
2. Faça upload das alterações para o GitHub (usando a interface web ou git)
3. A Vercel irá automaticamente reconstruir e implementar o site

## 6. Solução de Problemas

* **Erro de Base de Dados:** Verifique se a string de conexão `DATABASE_URL` está correta e se a base de dados está acessível
* **Erro de Importação:** Verifique se todas as dependências estão listadas no `requirements.txt`
* **Erro 500:** Verifique os logs na dashboard da Vercel para identificar o problema

## 7. Recursos Adicionais

* [Documentação da Vercel para Python](https://vercel.com/docs/functions/serverless-functions/runtimes/python)
* [Documentação do Flask](https://flask.palletsprojects.com/)
* [Documentação do Stripe](https://stripe.com/docs)

## 8. Próximos Passos

* Personalize o design e layout conforme a identidade visual da R.MARIN
* Adicione imagens reais dos produtos
* Configure emails transacionais para confirmação de encomendas
* Implemente análises e rastreamento para monitorizar o desempenho da loja
