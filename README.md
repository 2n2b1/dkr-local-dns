# DKR-LOCAL-DNS

## Usage
`docker run -it .`

## Example
### DNS Lookups will point to `__192.168.1.126__`, and then relay outside.

| Entry        | Reference           | Value  |
|:------------- |:-------------:| -----:|
| IP Address | N/A | __192.168.1.126__ |
| Host Record | A Record | __local.2n2b1.com__ |
| Local Name Server (NS) Record | NS Record | __ns1.local.2n2b1.com__ |
| Local Secondary Name Server (NS) Record | NS Record | __ns2.local.2n2b1.com__ |
| Hostmaster Record Entry | N/A | __hostmaster.local.2n2b1.com__ |
| Reverse Lookup DNS Address | N/A | __1.168.192.in-addr.arpa__ |
| Statement of Authority Record | SOA Record | __local.2n2b1.com:ns1.local.2n2b1.com__ |
| DNS Relay Lookup Address | PTR Record | __relay1.local.2n2b1.com__ |
| DNS Secondary Relay Lookup Address | PTR Record | __relay2.local.2n2b1.com__ |

#### Reverse Zone Records
```
## Reverse Zone
# Reverse DNS:
Z1.168.192.in-addr.arpa:ns1.local.2n2b1.com:hostmaster.local.2n2b1.com::::::::

# NS Records
&1.168.192.in-addr.arpa::ns1.local.2n2b1.com:::
&1.168.192.in-addr.arpa::ns2.local.2n2b1.com:::
```

#### Forward Zone Records
```
# SOA Delegation
Zlocal.2nsb1.com:ns1.local.2n2b1.com:hostmaster.local.2n2b1.com::::::::

# NameServer (ns1,ns2) delegation
&local.2n2b1.com::ns1.local.2n2b1.com:::
&local.2n2b1.com::ns2.local.2n2b1.com:::

# Points (A records)
=relay1.local.2n2b1.com::192.168.1.126:::
=relay2.local.2n2b1.com::192.168.1.126:::
=gateway.local.2n2b1.com::192.168.1.126:::
Cnscache.local.2n2b1.com::192.168.1.126:::
```

## Todo
1) A make file to build this file dynamtically
1) Look into other records, if necessary:
    * CAA Records
    * NAPTR Records
    * SVR Records

## TinyDNS
```
    Format: .fqdn:ip:x:ttl:timestamp:lo
    Example: +localsite.github.io:192.168.1.126:::in

    NS Records:
    &1.168.192.in-addr.arpa::ns.localsite.github.io

    [~]:$ tinydns-edit data data.new add [ns|childns|host|alias|mx] domain a.b.c.d
```

