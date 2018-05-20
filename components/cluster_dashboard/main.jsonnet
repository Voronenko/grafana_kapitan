local kap = import "lib/kapitan.libjsonnet";
local inv = kap.inventory();

local cluster_view = import "cluster_view.jsonnet";
local alb_view = import "alb_view.jsonnet";

{
  cluster_view: cluster_view,
  alb_view: alb_view,  
}