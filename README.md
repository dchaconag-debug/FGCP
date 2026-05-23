# Base de datos — Fundación de rehabilitación

Base de datos relacional diseñada en Oracle SQL para la gestión integral de una fundación de rehabilitación. Proyecto universitario de Bases de Datos — Universidad Nacional de Colombia.

## ¿Qué modela?

El sistema gestiona la información de:

- **Beneficiarios** — personas atendidas por la fundación, con sus tratamientos y seguimientos
- **Trabajadores y psiquiatras** — equipo profesional a cargo de los beneficiarios
- **Voluntarios y donantes** — red de apoyo externo con registro de donaciones
- **Actividades** — talleres y programas en los que participan los beneficiarios
- **Pruebas toxicológicas e informes de seguimiento** — historial clínico
- **Contactos de red de apoyo** — familiares y referentes de cada beneficiario
- **Usuarios del sistema** — control de acceso por roles

## Tecnologías

- Oracle SQL 11g
- Modelo Entidad-Relación (incluye archivo `.mwb` de MySQL Workbench para visualización del diagrama)
- Restricciones de integridad referencial (claves foráneas, constraints)

## Archivos

| Archivo | Descripción |
|---|---|
| `Fundacion.sql` | Script completo: creación de tablas, relaciones e inserción de datos |

## Cómo usar

1. Abre Oracle SQL Developer o cualquier cliente compatible con Oracle 11g
2. Ejecuta el script `Fundacion.sql`
3. Las tablas quedan creadas con datos de prueba listos para consultar

## Autor

David Chacón Agudelo — Ingeniería de Sistemas, UNAL
