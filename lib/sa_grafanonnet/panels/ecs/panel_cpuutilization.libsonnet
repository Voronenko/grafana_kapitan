local grafana = import "lib/grafonnet/grafana.libsonnet";
local graph_panel = grafana.graphPanel;

local grafana_ext = import "lib/sa_grafanonnet/main.libsonnet";

local ecsMetrics = grafana_ext.metrics.ecs;

local metricTarget = grafana_ext.targets.metric;

{
    new(
        datasource = "aws",
    )::
        graph_panel.new(
            title = "CPUUtilization (cluster $cluster, service $service)",
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
            nullPointMode=null,
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
            value_type='individual'
        )
        .addTarget(
            metricTarget.new(
                namespace = ecsMetrics.Namespace,
                metric = ecsMetrics.Metric_CPUUtilization,
                refId = "A"
            )
            .addDimension(ecsMetrics.Dimension_ClusterName.name, ecsMetrics.Dimension_ClusterName.variable)            
        )
        .resetYaxes()
        .addYaxis(format="percent", min=0, max=100, show=true)
        .addYaxis(show=false)
}
