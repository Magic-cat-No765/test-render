import os
from fastapi import FastAPI
from fastapi.responses import HTMLResponse
import uvicorn
import nest_asyncio
from pyngrok import ngrok

app = FastAPI()
app.ngrok_url = ''


@app.get('/', response_class=HTMLResponse)
def index():
    return f"URL: {app.ngrok_url.public_url}"


if __name__ == '__main__':
    mc_port = 25565
    web_port = 80
    ngrok.set_auth_token(os.getenv('NGROK_AUTH'))
    app.ngrok_url = ngrok.connect(addr=mc_port, proto='tcp')
    print(app.ngrok_url)
    nest_asyncio.apply()
    uvicorn.run(app)
