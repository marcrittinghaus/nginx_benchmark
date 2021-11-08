## Init repository
```
git submodule init
git submodule update
```

## Build Unikraft with nginx
Config already in repo. Just rerun `make menuconfig` to be sure.
```
cd apps/app-nginx/
make menuconfig
make
```

# Build wrk
```
cd wrk
make
```

# Setup bridge
Use `virbr0` for `/etc/network/interfaces.d/virbr0`

# Start unikraft
`./start-nginx.sh`

# Start wrk
`taskset -c 1-2 wrk/wrk -t14 -c30 -d10s http://172.32.255.2/index.html`

With 2x Intel(R) Xeon(R) Gold 6138 CPU @ 2.00GHz (3.4GHZ Turbo)
```
Running 10s test @ http://172.32.255.2/index.html
  14 threads and 30 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   176.94us  160.20us   9.44ms   99.86%
    Req/Sec    11.49k     1.38k   41.87k    99.50%
  1603596 requests in 10.10s, 1.26GB read
Requests/sec: 158799.25
Transfer/sec:    127.67MB
```
