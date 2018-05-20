local grafana = import "lib/grafonnet/grafana.libsonnet";
local template = grafana.template;

{
    new(
        name= "service",
        datasource = "aws",
        current = ""
    ):: 

        template.new(
            name = name,            
            datasource = datasource,            
            query = "dimension_values($region,AWS/ECS,CPUUtilization,ServiceName)",            
            label = "ECS Service",            
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