{
    new(
        namespace = "AWS/ApplicationELB",
        metric,
        region = "$region",
        refId = "A",
        statistics = "Average"
    ):: {
      alias: "",
      application: {
        filter: ""
      },
      dimensions: {
        LoadBalancer: "$loadbalancername"
      },
      functions: [],
      group: {
        filter: ""
      },
      host: {
        filter: ""
      },
      item: {
        "filter": ""
      },
      metricName: metric.name,
      mode: 0,
      namespace: namespace,
      options: {
        showDisabledItems: false
      },
      period: "",
      refId: "A",
      region: "$region",
      statistics: [
        statistics
      ],
      highResolution: false
    }
}
