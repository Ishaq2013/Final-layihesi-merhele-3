import sys
import os

# Kök qovluğu Python yoluna əlavə edirik ki, app.py və şablonlar tapılsın
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from app import app

# Vercel üçün tətbiqi aktivləşdiririk
application = app