local grafana = import "lib/grafonnet/grafana.libsonnet";
local template = grafana.template;

{
    new(
        name= "loadbalancername",
        datasource = "aws",
        current = ""
    ):: 

        template.new(
            name = name,            
            datasource = datasource,            
            query = "dimension_values($region,AWS/ApplicationELB,ActiveConnectionCount,LoadBalancer)",            
            label = "LoadBalancerName",            
            allValues = null,
            tagValuesQuery = "",
            // current = current,
            hide = '',
            regex = "",
            refresh = "load",
            includeAll = false,
            multi = false
        )    
}