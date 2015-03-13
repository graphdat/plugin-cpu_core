Boundary CPU Core Plugin
------------------------

The Boundary CPU Core Plugin reports the CPU utilization of each CPU core individually. Each core is separate source so when graphed, in the legend will be the hostname followed by "-CX" where X is the core index.

### Prerequisites

|     OS    | Linux | Windows | SmartOS | OS X |
|:----------|:-----:|:-------:|:-------:|:----:|
| Supported |   v   |    v    |    v    |  v   |

#### Boundary Meter Versions V4.0 Or Greater

To get the new meter:

    curl -fsS \
        -d "{\"token\":\"<your API token here>\"}" \
        -H "Content-Type: application/json" \
        "https://meter.boundary.com/setup_meter" > setup_meter.sh
    chmod +x setup_meter.sh
    ./setup_meter.sh

#### For Boundary Meter less than V4.0

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

