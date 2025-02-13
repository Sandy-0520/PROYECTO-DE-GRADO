# Dashboard de Inteligencia de Negocios para Consultorio Odontológico "Denta Bi-Ai"
## Descripción del Proyecto
Este proyecto desarrolla un dashboard de inteligencia de negocio para mejorar la gestión del consultorio odontológico "Denta Bi-Ai" en Bogotá. Se integra información proveniente del ERP y del software contable mediante procesos ETL en SSIS, almacenando los datos en SQL Server y visualizándolos en Power BI.

El objetivo es optimizar la toma de decisiones a través del análisis de KPIs clave, permitiendo identificar patrones en la demanda de servicios, mejorar la eficiencia operativa y fortalecer la retención de pacientes.

## Características Principales
- Integración de datos: Consolidación de datos administrativos y financieros del consultorio.
- Procesos ETL: Extracción, Transformación y Carga de datos en SQL Server con SSIS.
- Visualización interactiva: Desarrollo de un dashboard en Power BI con gráficos y reportes personalizables.
- Análisis de KPIs: Medición de indicadores como ocupación de citas, tasa de cancelación, rentabilidad y patrones de demanda.

## Tecnologías Utilizadas
- SQL Server (Almacenamiento y consulta de datos)
- SSIS (SQL Server Integration Services) (Procesos ETL)
- Power BI (Visualización de datos)
- Microsoft Excel (Exportación e integración de datos)

## Instalación y Configuración
### Requisitos Previos
- SQL Server instalado y configurado.
- SSIS habilitado para la ejecución de procesos ETL.
- Power BI Desktop instalado para la visualización de reportes.
- Acceso a los archivos de datos exportados desde el ERP y el software contable en formato Excel.

### Pasos de Instalación
- Configurar la base de datos:
  - Crear las tablas necesarias en SQL Server.
  - Importar los datos desde los archivos Excel.
- Ejecutar los procesos ETL:
  - Implementar los paquetes de SSIS para limpiar y transformar los datos.
  - Cargar los datos en el Data Warehouse.
- Abrir el Dashboard en Power BI:
  - Conectar Power BI a la base de datos SQL Server.
  - Cargar los datos procesados y configurar las visualizaciones.
 
## Autores
- David Augusto García Navarro
- Aura del Rosario Moreno Mora
- Andrea Giseth Sánchez Mendez
- Sandy Isabel Acosta Diaz

## Licencia
Este proyecto es de uso académico y no debe utilizarse con fines comerciales sin autorización previa.
