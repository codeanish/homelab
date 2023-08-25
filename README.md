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
NGINX proxy manager is being used as a reverse proxy with built in SSL. This enables me to access all my internally hosted services over SSL. The way it works is that I register an SSL certificate with NGINX proxy manager. I can then use that SSL Certificate to configure a set of reverse proxy hosts so that everything on *.local.example.com is routed to the appropriate service. I pass it https://homepage.local.example.com and it proxies that request to http://10.0.20.88:3000 while providing SSL and acting as the TLS termination point.

The process for creating a certificate that I've chosen is to create a certificate using letsencrypt (built into NGINX proxy manager) with a domain registered to an AWS account. The process for the creation of the certificate based on a domain registered in Route53 is as follows:

1. Register a domain in Route53
2. Get an AWS CLI access key and it's corresponding secret key
3. Go to NGINX proxy manager and click on certificates -> Add SSL Certificate
4. Fill in the form with the domain names you want. If you're going to host several services, make sure you include a wildcard subdomain e.g. example.com and *.example.com in order to be able to have services resolving to say https://adguard.example.com and https://nginx.example.com. Put your aws cli credentials into the form as well as an email address for letsencrypt.

Lets Encrypt is a certificate authority responsible for issuing certificates - this requires you to have control over the domain with which you want a certificate for. Lets Encrypt uses the ACME protocol to validate whether or not you own the domain. The issuance of certificates can be automated by a certbot ACME client (built into NGINX proxy manager). Certbot asks Lets Encrypt what it needs to do in order to prove that you have control over the domain. Lets Encrypt gives certbot some instructions as to what it needs in order for it to ensure that the domain is owned by you. This is validated by certbot putting a TXT type DNS record in Route53 against the domain. Lets Encrypt also provides certbot with a nonce (https://en.wikipedia.org/wiki/Cryptographic_nonce) which Certbot signs with it's private key and sends it back to Lets Encrypt to prove it controls the key pair. Once certbot has completed both of these steps, it lets Lets Encrypt know and Lets Encrypt goes and validates that the record exists when making a request to Route 53 and getting the TXT file to check the contents and validate the nonce with the public key of certbot. At this point, certbot is now authorized to do certificate management for the domain being requested.

Certbot can then request issuance of certificates from Lets Encrypt. Certbot sends a PKCS#10 certificate signing request along with it's public key to Lets Encrypt. When lets Encrypt validates the signatures, it sends along a certificate back to certbot. These certificates are stored in NGINX Proxy Manager for use with any of the proxy hosts defined.

For a more detailed explaination of the certificate issuance process read this - https://letsencrypt.org/how-it-works/


## Services I want to run
* Bitwarden
* Search Engine
* K8S
* Automated unifi configuration
* Plex (hosted before, need to do it again)
* Cloud storage
* Notes
* VS Code Server
* Self developed apps
* Load balancer and high availability
* Grafana
* Loki
