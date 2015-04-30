# Boundary CPU Core Plugin

The Boundary CPU Core Plugin reports the CPU utilization of each CPU core individually. Each core is separate source so when graphed, in the legend will be the hostname followed by "-CX" where X is the core index.

## Prerequisites

### Supported OS

|     OS    | Linux | Windows | SmartOS | OS X |
|:----------|:-----:|:-------:|:-------:|:----:|
| Supported |   v   |    v    |    v    |  v   |

#### Boundary Meter Versions V4.0 or later

- To install new meter go to Settings->Installation or [see instructons|https://help.boundary.com/hc/en-us/sections/200634331-Installation]. 
- To upgrade the meter to the latest version - [see instructons|https://help.boundary.com/hc/en-us/articles/201573102-Upgrading-the-Boundary-Meter].

|  Runtime | node.js | Python | Java |
|:---------|:-------:|:------:|:----:|
| Required |    +    |        |      |

- [How to install node.js?](https://help.boundary.com/hc/articles/202360701)

### Plugin Setup
None

#### Plugin Configuration Fields
None

### Metrics Collected

|Metric Name             |Description                                                   |
|:-----------------------|:-------------------------------------------------------------|
|Per core CPU utilization|Per core CPU utilization                                      |

