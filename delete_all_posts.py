import requests, json, jwt
from datetime import datetime as date

# Admin API key goes here
key = '623654d5d8a90300014f0c87:ad4a79591a2cd2d619259f7298dc90460de80148185677d9811240b86dc6fd1f'

# Split the key into ID and SECRET
id, secret = key.split(':')

# Prepare header and payload
iat = int(date.now().timestamp())

header = {'alg': 'HS256', 'typ': 'JWT', 'kid': id}
payload = {
    'iat': iat,
    'exp': iat + 5 * 60,
    'aud': '/v3/admin/'
}

# Create the token (including decoding secret)
token = jwt.encode(payload, bytes.fromhex(secret), algorithm='HS256', headers=header)

# API URL
url = 'http://localhost/ghost/api/v3/admin/posts/'

# API Headers
headers = {'Authorization': 'Ghost {}'.format(token)}

# Get All Posts
params = {'formats': 'html,mobiledoc', 'limit': 'all', 'filter': 'slug: -tags'}
all_posts = requests.get(url, params=params, headers=headers)

# Filter Posts IDs
json_posts = json.loads(all_posts.text)['posts']
post_ids = [post['id'] for post in json_posts]

# Delete All Posts
for post in post_ids:
    delete = requests.delete(url + post + '/', headers=headers)