install-deepmind-kapitan:
	pip3 install --user --upgrade git+https://github.com/deepmind/kapitan.git  --process-dependency-links

build:
	kapitan compile

grafana_push:
	for i in `ls ./compiled/project/dashboards/*.json` ;do curl -i -u $(GRAFANA_USERNAME):$(GRAFANA_PASSWORD) -H "Content-Type: application/json" -X POST http://$(GRAFANA_HOST)/api/dashboards/db -d @$(i) ; done
