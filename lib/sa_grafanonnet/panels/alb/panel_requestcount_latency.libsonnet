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
            title = "RequestCount / Latency",
            span = 12,
            fill = 1,
            linewidth=1,
            decimals=null,
            description=null,
            min_span=null,
            format='short',
            min=0,
            max=null,
            lines=true,
            datasource=null,
            points=false,
            bars=false,
            height=null,
            nullPointMode='null',
            dashes=false,
            stack=false,
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
            value_type='cumulative'
        )
        .addTarget(
            metricTarget.new(
                namespace = albMetrics.Namespace,
                metric = albMetrics.Metric_RequestCount,
                refId = "A"
            )
        )
        .addTarget(
            metricTarget.new(
                namespace = albMetrics.Namespace,
                metric = albMetrics.Metric_TargetResponseTime,
                refId = "B"                
            )
        )
        .addSeriesOverride(
            {
            "alias": "Latency_Average",
            "yaxis": 2
            }            
        )        
        .addSeriesOverride(
            {
            "alias": "TargetResponseTime_Average",
            "yaxis": 2
            }            
        )             

}