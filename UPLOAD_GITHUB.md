# Guia para Upload dos Arquivos no GitHub

Para garantir que o seu site R.MARIN seja corretamente alojado na Vercel, é essencial fazer o upload de todos os arquivos necessários no GitHub. Siga este guia passo a passo:

## Arquivos e Pastas Essenciais

Certifique-se de incluir todos estes arquivos e pastas no seu repositório GitHub:

- `api/` (pasta com o arquivo index.py)
- `src/` (pasta com todo o código da aplicação)
- `vercel.json` (configuração da Vercel)
- `requirements.txt` (dependências do projeto)
- `README.md` (instruções de implementação)
- `rmarin_db_structure.sql` (estrutura MySQL original)
- `rmarin_db_structure_postgres.sql` (estrutura adaptada para PostgreSQL)

## Arquivos a NÃO Incluir

Não faça upload destes arquivos/pastas para o GitHub:

- `venv/` ou qualquer ambiente virtual
- Arquivos `.pyc` (cache Python)
- Arquivos temporários ou de sistema (como `.DS_Store`, `.git`)
- Arquivos com senhas ou chaves secretas

## Método de Upload (Interface Web do GitHub)

1. Acesse [GitHub](https://github.com/) e faça login
2. Crie um novo repositório (ex: `rmarin-store`)
3. Na página do repositório vazio, clique em "uploading an existing file"
4. Arraste todos os arquivos e pastas para a área de upload
   - **Importante**: Para fazer upload de pastas completas, você precisa arrastar a pasta inteira
   - Se o GitHub não permitir arrastar pastas, você precisará criar as pastas manualmente e fazer upload dos arquivos individuais
5. Adicione uma mensagem de commit como "Versão inicial da loja R.MARIN"
6. Clique em "Commit changes"

## Verificação Final

Após o upload, verifique se a estrutura do seu repositório está assim:

```
rmarin-store/
├── api/
│   └── index.py
├── src/
│   ├── models/
│   ├── routes/
│   ├── static/
│   ├── __init__.py
│   ├── forms.py
│   └── main.py
├── vercel.json
├── requirements.txt
├── README.md
├── rmarin_db_structure.sql
└── rmarin_db_structure_postgres.sql
```

Se algum arquivo ou pasta estiver faltando, faça o upload novamente seguindo as instruções acima.

## Próximos Passos

Depois de confirmar que todos os arquivos estão corretamente no GitHub, você estará pronto para implementar o site na Vercel seguindo as instruções no README.md.
