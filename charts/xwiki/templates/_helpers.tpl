{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "xwiki.name" -}}
{{- include "common.names.name" . }}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "xwiki.fullname" -}}
{{- include "common.names.fullname" . }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "xwiki.labels" -}}
{{- include "common.labels.standard" . }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "xwiki.selectorLabels" -}}
{{- include "common.labels.matchLabels" . }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "xwiki.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "xwiki.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Create the name of init scripts configmap 
*/}}
{{- define "xwiki.initScripts" -}}
{{- printf "%s-init-scripts" (include "xwiki.fullname" .) }}
{{- end }}

{{/*
Istio cert name to be used
*/}}
{{- define "xwiki.istio.credentialName" -}}
{{- $secretName := .Values.istio.tls.secretName }}
{{- if $secretName }}
{{- printf "%s" (tpl $secretName $) -}}
{{- else }}
    {{- printf "%s-istio-cert" (include "xwiki.fullname" .) -}}
{{- end }}
{{- end }}

{{/*
Istio gateway name to be used
*/}}
{{- define "xwiki.istio.gatewayName" -}}
{{- $gatewayName := .Values.istio.externalGatewayName }}
{{- if $gatewayName }}
{{- printf "%s" (tpl $gatewayName $) -}}}
{{- else }}
{{- printf "%s-gateway" (include "xwiki.fullname" .) }}
{{- end }}
{{- end }}