{{- define "fullstack-app.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "fullstack-app.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else }}
{{- printf "%s-%s" .Release.Name (include "fullstack-app.name" .) | trunc 63 | trimSuffix "-" -}}
{{- end }}
{{- end -}}

{{- define "fullstack-app.frontend.fullname" -}}
{{- printf "%s-frontend" (include "fullstack-app.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "fullstack-app.backend.fullname" -}}
{{- printf "%s-backend" (include "fullstack-app.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "fullstack-app.labels" -}}
helm.sh/chart: {{ include "fullstack-app.chart" . }}
app.kubernetes.io/name: {{ include "fullstack-app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "fullstack-app.chart" -}}
{{ .Chart.Name }}-{{ .Chart.Version }}
{{- end -}}
