# homelab
Homelab configuration and setup scripts. The goal of this project is to create a fully immutable homelab where I can rebuild/rehydrate my entire homelab without just taking backups of the VM's that the homelab runs on.

## Order of operations
1. Create Packer images
2. Run terraform vm creation
3. Perform installation via Ansible

## Services being run
### Adguard Home
https://adguard.com/en/adguard-home/overview.html
Adguard Home is a forwarding DNS server and DNS filtering server. It's job is to take DNS requests from all clients on the network and forward the DNS requests to an upstream "recursive" dns server - in my case, unbound (which I also host)

### Unbound DNS
https://nlnetlabs.nl/projects/unbound/about/
Unbound is a validating, recursive, caching DNS server. This connects directly to the root authoritative DNS servers (list is available https://www.internic.net/domain/named.root) and returns the IP addresses of requests being made out to it. The IP addresses are cached by unbound and this then serves out the domain name resolution. Using this is a replacement to using something like google 8.8.8.8 or cloudflare 9.9.9.9 or even quad9 as my recursive upstream dns server. 

### NGINX proxy manager
https://nginxproxymanager.com/
NGINX proxy manager is being used as a reverse proxy with built in SSL. This enables me to access all my internally hosted services over SSL. The way it works is that I register an SSL certificate with NGINX proxy manager. I can then use that SSL Certificate to configure a set of reverse proxy hosts so that everything on *.local.codeanish.com is routed to the appropriate service. I pass it https://homepage.local.codeanish.com and it proxies that request to http://10.0.20.88:3000 while providing SSL and acting as the TLS termination point.  