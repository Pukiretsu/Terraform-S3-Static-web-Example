# 🚀 AWS S3 Multi-Site Terraform Factory

Este repositorio contiene un módulo de Terraform diseñado para el despliegue automatizado y escalable de múltiples sitios web estáticos en AWS S3. Utiliza un patrón de diseño basado en mapas de objetos, permitiendo crear decenas de sitios web con una sola definición de bloque.

## 🛠️ Arquitectura del Proyecto

El proyecto está diseñado siguiendo las mejores prácticas de modularización:

* Root Module: Define la orquestación y las variables globales (Tags, Cuentas).
* S3 Website Module: Motor lógico que gestiona Buckets, Políticas de Acceso, Hosting y Carga de archivos.
* Data Factory: Estructura de datos dinámica que mapea archivos locales de la carpeta /src a sus respectivos buckets.

## 📂 Estructura del Repositorio

.
├── main.tf                 # Llamada al módulo y configuración de proveedores
├── variables.tf            # Definición de esquemas para los mapas de objetos
├── terraform.tfvars        # Tu configuración personalizada (Buckets, Tags, Proyectos)
├── outputs.tf              # Muestra las URLs públicas generadas
├── src/                    # Carpeta raíz de contenidos
│   ├── index-page/         # Archivos para el sitio A
│   └── docs-page/          # Archivos para el sitio B
└── modules/
    └── s3-static-website/  # Lógica interna del recurso S3

## 🚀 Guía de Inicio Rápido

### 1. Requisitos Previos
* Terraform v1.0.0+
* Credenciales de AWS configuradas (aws configure)
* Permisos para crear Buckets S3 y Políticas IAM.

### 2. Configuración de Variables
Edita tu archivo terraform.tfvars siguiendo el formato de mapa:

s3-static-pages = {
  "marketing" = {
    project     = "campaña-2026"
    bucket_name = "web-principal"
    folder_path = "marketing-assets"
    sec_tags    = { CostCenter = "101" }
  }
}

### 3. Despliegue
$ terraform init
$ terraform plan
$ terraform apply -auto-approve

## 📄 Características Técnicas

* Global Naming Convention: Los buckets se nombran automáticamente siguiendo el patrón: ause1-s3-${account}-${project}-${name}.
* MIME Type Auto-Detection: El módulo detecta automáticamente extensiones .html, .css, .js, etc.
* Automated Public Access: Configura las políticas de GetObject y desactiva los bloqueos de acceso público.
* Tag Merging: Combina etiquetas globales con etiquetas específicas mediante la función merge().

## 🖥️ Autores

* Angel Gonzalez Padilla - Cloud Infrastructure Engineer

---
Proyecto desarrollado para el Examen de Terraform - 2026.