-- ══════════════════════════════════════════
-- MiniStore — Soluciones con Outer JOINs
-- Autor: [Juan Manuel]
-- Fecha: [10/07/26]
-- ══════════════════════════════════════════

-- ── CONSULTA 1: LEFT JOIN ─────────────────
-- Pregunta de negocio: ¿Qué productos del catálogo nunca fueron vendidos?
-- Mostrá todos los productos y sus ventas asociadas.
-- Los productos sin ventas aparecerán con NULL en las columnas de ventas.

--Hago los Alias de las columnas ya que tiene campos con el mismo nombre y necesito diferenciarlos.

SELECT p.producto_id, p.nombre, p.precio, p.categoria
FROM productos AS p;

SELECT v.venta_id, v.producto_id, v.cliente_id, v.cantidad, v.fecha_venta
FROM ventas AS v;

-- [Tu consulta aquí]

SELECT 
    p.producto_id,
    p.nombre AS nombre_producto,
    p.categoria,
    v.venta_id,
    v.cantidad,
    v.fecha_venta
FROM productos p
LEFT JOIN ventas v ON p.producto_id = v.producto_id;


--Los productos Hub USB-C (108) y Parlante Bluetooth (109) son los que nunca fueron vendidos, en las columnas de ventas aparecen como NULL.

-- ── CONSULTA 2: RIGHT JOIN ────────────────
-- Pregunta de negocio: ¿Existen ventas registradas con productos
-- que no figuran en nuestro catálogo? (posible error de carga de datos)
-- Los registros huérfanos aparecerán con NULL en las columnas de productos.

-- [Tu consulta aquí]
SELECT 
    v.venta_id,
    v.producto_id AS producto_huerfano,
    v.cliente_id,
    v.cantidad,
    v.fecha_venta,
    p.nombre AS producto_del_catalogo
FROM productos p
RIGHT JOIN ventas v ON p.producto_id = v.producto_id
WHERE p.producto_id IS NULL;

--la venta ID 10, que se cargó con el código de producto 999. Es un error de carga, ya que el valor es NULL.


-- ── CONSULTA 3: FULL OUTER JOIN ───────────
-- Pregunta de negocio: Vista completa de auditoría que muestre
-- todos los productos y todas las ventas sin perder ninguna fila,
-- identificando tanto productos sin ventas como ventas sin producto.

-- [Tu consulta aquí]

SELECT 
    -- Datos del catálogo
    p.producto_id AS catalogo_id,
    p.nombre AS nombre_producto,
    
    -- Datos de la venta
    v.venta_id,
    v.producto_id AS venta_id_producto,
    v.cantidad,
    
    -- Clasificación de auditoría
    CASE 
        WHEN v.venta_id IS NULL THEN 'Producto SIN ventas'
        WHEN p.producto_id IS NULL THEN 'Venta SIN producto en catálogo (Error)'
        ELSE 'Operación Correcta'
    END AS estado_auditoria
FROM productos p
FULL OUTER JOIN ventas v ON p.producto_id = v.producto_id
ORDER BY estado_auditoria DESC;





