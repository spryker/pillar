# Parameters for ELK (Elasticsearch - Logstash - Kibana setup)
#
# Please note that for ELK we are using a seperate Elasticsearch instance, not the instances used for catalog data

elk:
  elasticsearch:

    # ES cluster name, should be different than catalog cluster(s)
    # Optional, default: spryker-elk-01
    clustername: spryker-elk-01

    # Amount of expected nodes in cluster (see elasticsearch docs)
    # Optional, default: 1
    expected_nodes: 1

    # Minimum number of active nodes to form a cluster (see elasticsearch docs)
    # Optional, default: 1
    minimum_nodes: 1

    # Enable multicast discovery of elasticsearch hosts? (see elasticsearch docs)
    # Optional, default: false
    enable_multicast_discovery: false

    # JVM heap size for Elasticsearch
    # Optional, default: 384m
    heap_size: 384m

  kibana:
    # Mandatory, default: no value
    hostname: kibana.spryker.dev
