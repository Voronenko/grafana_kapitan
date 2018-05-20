{
    Namespace: "AWS/ECS",
    
    Metric_CPUReservation: {
        name: "CPUReservation"
    },

    Metric_CPUUtilization: {
        name: "CPUUtilization"
    },

    Metric_MemoryReservation: {
        name: "MemoryReservation"
    },

    Metric_MemoryUtilization: {
        name: "MemoryReservation"
    },

    Dimension_ClusterName: {
        name: "ClusterName",
        variable: "$cluster"
    },

    Dimension_ServiceName: {
        name: "ServiceName",
        variable: "$service"        
    },

    Dimensions: [self.Dimension_ClusterName, self.Dimension_ServiceName],

}