# Music Server

Mocks a music server, does not actually play any music, however, it is possible to attach any player instance to this.
Uses FastAPI to derive the API and creates an [openapi.json](./data/openapi.json) file with the definition.
Makes use of the REST principle, does not remember any information of the previous client requests.

## Installation
Version used: Python 3.11

```commandline
pip install -r requirements.txt
```
