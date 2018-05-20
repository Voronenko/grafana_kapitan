{
    Namespace: "AWS/ApplicationELB",
    
    Metric_RequestCount: {
        name: "RequestCount"
    },

    Metric_TargetResponseTime: {
        name: "TargetResponseTime"
    },

    Metric_HTTPCode_Target_2XX_Count: {
        name: "HTTPCode_Target_2XX_Count"
    },
    

    Metric_HTTPCode_Target_3XX_Count: {
        name: "HTTPCode_Target_3XX_Count"
    },
    

    Metric_HTTPCode_Target_4XX_Count: {
        name: "HTTPCode_Target_4XX_Count"
    },


    Metric_HTTPCode_Target_5XX_Count: {
        name: "HTTPCode_Target_5XX_Count"
    },


    Metric_HTTPCode_ELB_4XX_Count: {
        name: "HTTPCode_ELB_4XX_Count"
    },

    Metric_HTTPCode_ELB_5XX_Count: {
        name: "HTTPCode_ELB_5XX_Count"
    },


    Metric_ActiveConnectionCount: {
        name: "ActiveConnectionCount"
    },

    Metric_NewConnectionCount: {
        name: "NewConnectionCount"
    },

    Metric_RejectedConnectionCount: {
        name: "RejectedConnectionCount"
    },

    Metric_TargetConnectionErrorCount: {
        name: "TargetConnectionErrorCount"
    },

// Filter the metric data by Availability Zone.
    Dimension_AvailabilityZone: {
        name: "AvailabilityZone",
        variable: "$az"                
    },

// Filter the metric data by load balancer. Specify the load balancer as follows: app/load-balancer-name/1234567890123456 (the final portion of the load balancer ARN).
    Dimension_LoadBalancer: {
        name: "LoadBalancer",
        variable: "$loadbalancername"
    },

//Filter the metric data by target group. Specify the target group as follows: targetgroup/target-group-name/1234567890123456 (the final portion of the target group ARN).
    Dimension_TargetGroup: {
        name: "TargetGroup",
        variable: "$targetgroup"        
    },

    Dimensions: [self.Dimension_AvailabilityZone,self.Dimension_LoadBalancer, self.Dimension_TargetGroup],
}

