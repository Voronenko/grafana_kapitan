local grafana = import "lib/grafonnet/grafana.libsonnet";
local template = grafana.template;

{
    new(
        name= "cluster",
        datasource = "aws",
        current = ""
    ):: 

        template.new(
            name = name,            
            datasource = datasource,            
            query = "dimension_values($region,AWS/ECS,CPUUtilization,ClusterName)",            
            label = "Cluster",            
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