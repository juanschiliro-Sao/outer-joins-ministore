# outer-joins-ministore
Contexto Sos analista de datos en MiniStore, una tienda minorista. El equipo de operaciones necesita respuestas a tres preguntas de negocio concretas que requieren cruzar el catálogo de productos con el historial de ventas, incluyendo los casos donde no hay coincidencia entre ambas tablas.


Tu README debe responder las siguientes preguntas con argumentos propios y ejemplos concretos del ejercicio:

¿Por qué usaste LEFT JOIN para la Consulta 1 y no INNER JOIN? ¿Qué se perdería si usaras INNER JOIN?.
--Use el LEFT JOIN porque tome la tabla de la izquierda como prioridad. El INNER JOIN solo muestra las filas que tienen una coincidencia exacta en ambas tablas, entonces pierdo los productos 108 y 109; como no se vendieron no existiria la tabla.

¿Por qué usaste RIGHT JOIN para la Consulta 2? ¿Qué tabla está a la izquierda y cuál a la derecha en tu consulta?
--Use Right JOIN porque la prioridad era revisar los registros de la tabala de ventas para detectar errores. Ala izquierda quedo productos y a la derecha ventas, segun el codigo usado.

¿Qué representan los valores NULL en cada resultado? Explicá con un ejemplo concreto de los datos qué significa que venta_id sea NULL en la Consulta 1 y que producto_id de productos sea NULL en la Consulta 2.
-- El NULL es una ausencia de datos, no es un 0 o un texto en blanco. En la Consulta 1 significa que el producto lo tengo registrado pero nunca lo comrparon, por ejemplo el 108.
En la Consulta 2 significa que se registro una venta pero el codigo del producto no existe en le catalogo, por ejemplo la venta 10 donde el cliente 205 compro el producto con ID 999.

¿Cuándo usarías FULL OUTER JOIN en un caso real de negocio?
--Se puede usar para conciliaciones bancarias; migraciones de sistemas; Control de Stock y Logistica.
