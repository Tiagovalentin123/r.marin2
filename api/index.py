import sys
import os

# Adicionar diretórios ao path para importações
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from src.main import app

# Handler para a Vercel
def handler(request, response):
    return app(request, response)

# Exportar a aplicação Flask para a Vercel
app.debug = False
