local grafana = import "lib/grafonnet/grafana.libsonnet";
local template = grafana.template;

{
    new(
        name= "region",
        datasource = "aws",
        current = "us-east-1"
    ):: 
        template.new(
            name = name,            
            datasource = datasource,            
            query = "regions()",            
            label = "Region",            
            allValues = null,
            tagValuesQuery = "",
            current = current,
            hide = '',
            regex = "",
            refresh = "load",
            includeAll = false,
            multi = false
        )

}

            // options = [],
            // sort = 0,
            // tags = [],
            // tagsQuery = "",
            // type = "query",
            // useTags = false         
