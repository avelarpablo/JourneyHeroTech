# JourneyHeroTech

## Descripción
El presente proyecto es una simulación de un sistema de tiendas de repuestos de vehículos, que consta de un sistema central que se comunica con el resto de tiendas para dar al usuario la disponibilidad de un repuesto dado en las diferentes tiendas, ordenando el resultado según precio y ubicación de la tienda.

## Prueba Local
### Depurar cada API
Para probar la solución de manera local será necesario depurar cada API en una nueva instancia (los puertos de despliegue están configurados como se muestra a continuación). La API de la tienda central consultará internamente el resto de APIs.

1. Central: https://localhost:7070/api/RepuestosCentral
2. Tienda A: https://localhost:7269/api/RepuestosTiendaA
3. Tienda B: https://localhost:7211/api/RepuestosTiendaB
4. Tienda C: https://localhost:7260/api/RepuestosTiendaC

### Crear BDs
En el directorio DBBackups se encuentran los archivos .sql para crear las BD que consume cada API.
Sera necesario configurar la cadena de conexión de BD para cada API. Esta configuración se encuentra en el archivo __appsettings.json__ de cada proyecto.

### Modificar endpoints 
Además de la cadena de conexión para cada API, será necesario modificar los endpoints de cada tienda en el __appsettings.json__ del Sistema Central, utilizando las URL mostradas anteriormente.