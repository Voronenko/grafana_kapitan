local kap = import "lib/kapitan.libjsonnet";
local inv = kap.inventory();

local grafana = import "lib/grafonnet/grafana.libsonnet";
local dashboard = grafana.dashboard;
local row = grafana.row;

local grafana_ext = import "lib/sa_grafanonnet/main.libsonnet";

local singlestat = grafana.singlestat;
local text = grafana.text;


dashboard.new(
    "Cluster view",
    editable = true,    
    tags=[inv.parameters.env],
)
.addTemplate(
    grafana_ext.variables.regions.new()
)
.addTemplate(
    grafana_ext.variables.clusters.new()
)
.addTemplate(
    grafana_ext.variables.cluster_services.new()
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
        grafana_ext.panels.ecs.cpuutilization.new()
    )    
)
.addRow(
    row.new()
    .addPanel(
        grafana_ext.panels.ecs.memoryutilization.new()
    )    
)
.addRow(
    row.new()
    .addPanel(
        grafana_ext.panels.ecs.cpureservation.new()
    )    
)
.addRow(
    row.new()
    .addPanel(
        grafana_ext.panels.ecs.memoryreservation.new()
    )    
)

