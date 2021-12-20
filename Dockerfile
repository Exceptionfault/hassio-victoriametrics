ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

# Copy data for add-on
COPY victoria-metrics-prod /
COPY prometheus.yml /
RUN chmod a+x /victoria-metrics-prod

CMD [ "/victoria-metrics-prod", "-storageDataPath", "/data", "-promscrape.config", "/prometheus.yml"]
