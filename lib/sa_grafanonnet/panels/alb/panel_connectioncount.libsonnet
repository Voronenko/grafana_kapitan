local grafana = import "lib/grafonnet/grafana.libsonnet";
local graph_panel = grafana.graphPanel;

local grafana_ext = import "lib/sa_grafanonnet/main.libsonnet";

local albMetrics = grafana_ext.metrics.alb;

local metricTarget = grafana_ext.targets.metric;

{
    new(
        datasource = "aws",
    ):: 
        graph_panel.new(
            title = "ConnectionCount",
            span = 12,
            fill = 1,
            linewidth=2,
            decimals=null,
            description=null,
            min_span=null,
            format='short',
            min=0,
            max=null,
            lines=true,
            datasource=datasource,
            points=false,
            bars=false,
            height=null,
            nullPointMode='null as zero',
            dashes=false,
            stack=true,
            repeat=null,
            repeatDirection=null,
            sort=0,
            show_xaxis=true,
            legend_show=true,
            legend_values=true,
            legend_min=true,
            legend_max=true,
            legend_current=true,
            legend_total=true,
            legend_avg=true,
            legend_alignAsTable=true,
            legend_rightSide=false,
            legend_hideEmpty=null,
            legend_hideZero=null,
            legend_sort=null,
            legend_sortDesc=null,
            aliasColors={},
            value_type='individual'
        )
        .addTarget(
            metricTarget.new(
                namespace = albMetrics.Namespace,
                metric = albMetrics.Metric_ActiveConnectionCount,
                refId = "D"
            )
            .addDimension(albMetrics.Dimension_LoadBalancer.name, albMetrics.Dimension_LoadBalancer.variable)
        )        
        .addTarget(
            metricTarget.new(
                namespace = albMetrics.Namespace,
                metric = albMetrics.Metric_NewConnectionCount,
                refId = "C"
            )
            .addDimension(albMetrics.Dimension_LoadBalancer.name, albMetrics.Dimension_LoadBalancer.variable)            
        )       
        .addTarget(
            metricTarget.new(
                namespace = albMetrics.Namespace,
                metric = albMetrics.Metric_RejectedConnectionCount,
                refId = "B"
            )
            .addDimension(albMetrics.Dimension_LoadBalancer.name, albMetrics.Dimension_LoadBalancer.variable)            
        )       
        .addTarget(
            metricTarget.new(
                namespace = albMetrics.Namespace,
                metric = albMetrics.Metric_TargetConnectionErrorCount,
                refId = "A"
            )
            .addDimension(albMetrics.Dimension_LoadBalancer.name, albMetrics.Dimension_LoadBalancer.variable)            
        )

        .addSeriesOverride(
            {
            "alias": "HTTPCode_ELB_4XX_Sum",
            "yaxis": 2
            }            
        )
        .addSeriesOverride(
            {
            "alias": "HTTPCode_ELB_5XX_Sum",
            "yaxis": 2
            }            
        )
        .resetYaxes()
        .addYaxis(format="none", min=0)
        .addYaxis(format="short", min=0, show=false)
        
        
}