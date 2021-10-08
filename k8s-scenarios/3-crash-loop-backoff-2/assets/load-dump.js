const NUM = parseInt(process.env.NUM_LOOKUPS) || 1e4;
const DOMAIN = process.env.DOMAIN || 'web-svr.default.svc.cluster.local.';
const CONC = parseInt(process.env.CONCURRENCY) || 1;
// Options: 4, 6, or 0.
// 4 -- only IPv4 address is looked up
// 6 -- only IPv6
// 0 -- both IPv4 and IPv6 are looked up
const FAMILY = parseInt(process.env.FAMILY) || 4;

let sum = 0;
let count = NUM * CONC;
for(let i = 0; i < NUM; i++) {
  for(let k = 0; k < CONC; k++) {
    setTimeout(() => {
      let then = Date.now();
      dns.lookup(DOMAIN, {family: FAMILY}, (err, addr, fam) => {
        if(err) {
          console.log(err);
        }
        else {
          sum += Date.now() - then;
        }
        count--;
      });
    }, 10 * i);
  }
}

let i = setInterval(() => {
  if(!count) {
    console.log('done');
    clearInterval(i);

    console.log('Lookups made:', NUM*CONC);
    console.log('average latency:', sum/(NUM*CONC));
  } else {
    console.log(count, 'dns look ups still to be made');
  }
}, 5000).unref();
