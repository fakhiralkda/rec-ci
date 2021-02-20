import os
import sys
from pyrogram import Client

api_id = int(os.environ.get("ID") or 0)
api_hash = os.environ.get("HASH") or None
bot_token = os.environ.get("TOKED") or None

with Client("bot", api_id, api_hash, bot_token=bot_token) as app:
    app.send_document(-1001317890919, document=sys.argv[1], caption=sys.argv[2])
