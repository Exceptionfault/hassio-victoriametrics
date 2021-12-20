# Victoria Metrics for Homeassistant

## Configuration

### Retention
To define the retention, that is how long VictoriaMetrics will keep it's data, set it to a number in months.
You can also use shorter retenion by setting a value like `5d`.

See: https://github.com/VictoriaMetrics/VictoriaMetrics#retention

## Scraping data from HomeAssistant
To scrape data from HomeAssistant, you can use the `Prometheus` exporter. Add the following code 
to you `configuration.yaml`.

```yml
prometheus:
  filter:
    include_entity_globs:
      - sensor.*_temperature
      - sensor.*_humidity
      - sensor.*_illumination
      - sensor.*_brightness
      - sensor.*_wind_speed
```

Finally check the `prometheus.yml` of this addon and adjust IP of your installation. 
Also make sure to create a long-living token as `bearer_token` for authentication.


## Sending Data to VictoriaMetrics
To send data from HomeAssistant to VictoriaMetrics, you can use the `InfluxDB` integration. Add the following code
to your `configuration.yaml` to have a basic setup.

```yml
influxdb:
  api_version: 1
  host: localhost
  port: 8428
  measurement_attr: domain__device_class
  include:
    entity_globs:
      - sensor.*_temperature
      - sensor.*_humidity
      - sensor.*_illumination
      - sensor.*_brightness
      - sensor.*_wind_speed
```
