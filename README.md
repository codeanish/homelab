# homelab
Homelab configuration and setup scripts

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