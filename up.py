import os
import telethon
import sys
from telethon.sync import TelegramClient

api_id = int(os.environ.get("ID") or 0)
api_hash = os.environ.get("HASH") or None
bot_token = os.environ.get("TOKED") or None

bot = TelegramClient('bot', api_id, api_hash).start(bot_token=bot_token)

async def main():
    await bot.send_file(-1001258092054, file=sys.argv[1], caption=sys.argv[2])

with bot:
    bot.loop.run_until_complete(main())
