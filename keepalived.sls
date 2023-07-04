install-pkg:
  pkg.installed:
    - name: keepalived
    - name: nginx

nginx-config-file-managed:
  file.managed:
    - name:     /etc/nginx/sites-available/default
    - user:     root
    - group:    root
    - template: jinja
    - source: salt:///nginx.conf.tmpl
    - context:
        config: nginx.config

nginx-service-running:
  service.running:
    - name: nginx.service
    - reload: True

nginx-service-enabled:
  service.enabled:
    - name: nginx.service

keepalived-config-file-managed:
  file.managed:
    - name:     /etc/keepalived/keepalived.conf
    - user:     root
    - group:    root
    - template: jinja
    - source: salt:///keepalived.conf.tmpl
    - context:
        config: keepalived.config

keepalived-service-running:
  service.running:
    - name: keepalived.service

keepalived-service-enabled:
  service.enabled:
    - name: keepalived.service
