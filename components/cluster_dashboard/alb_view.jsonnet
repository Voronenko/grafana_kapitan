local kap = import "lib/kapitan.libjsonnet";
local inv = kap.inventory();

local grafana = import "lib/grafonnet/grafana.libsonnet";
local dashboard = grafana.dashboard;
local row = grafana.row;

local grafana_ext = import "lib/sa_grafanonnet/main.libsonnet";

local singlestat = grafana.singlestat;
local text = grafana.text;

local alb_requests_panel = grafana_ext.panels.alb.requestcount_latency;
local alb_httpcode_panel = grafana_ext.panels.alb.http_code;
local alb_connectioncount_panel = grafana_ext.panels.alb.connectioncount;


dashboard.new(
    "Application load balancers view",
    editable = true,
    tags=[inv.parameters.env],
)
.addTemplate(
    grafana_ext.variables.regions.new()
)
.addTemplate(
    grafana_ext.variables.app_loadbalancers.new()
)
.addRow(
    row.new()
    .addPanel(
        text.new(
            title= inv.parameters.cluster_name
        )
    )
)
.addRow(
    row.new()
    .addPanel(
        alb_requests_panel.new(
        )
    )
)
.addRow(
    row.new()
    .addPanel(
        alb_httpcode_panel.new(
        )
    )
)
.addRow(
    row.new()
    .addPanel(
        alb_connectioncount_panel.new(
        )
    )
)
