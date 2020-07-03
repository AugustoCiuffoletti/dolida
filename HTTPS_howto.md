### Adding HTTPS

We use a nginx docker that uses a self-signed key: when deployng to a real server we will use a letsencrypt key.

The *https* directory will be uploaded in the nginx proxy, and contains its configuration, the key and the self-signed certificate.

The key and the certificate are obtained with:

    $ openssl req -subj '/CN=localhost' -x509 -newkey rsa:4096 -nodes -keyout key.pem -out cert.pem -days 365

and are valid for 365 days only.

The configuration instructs nginx to route port 443 (which stands for https) to port 5000 on localhost

When launching the nginx proxy the *https* directory will be loaded in the nginx configuration directory, /etc/nginx/conf.d/ 

    sudo docker run -d --name nginx_proxy --network=host -v `pwd`:/etc/nginx/conf.d -p 443:443 nginx
